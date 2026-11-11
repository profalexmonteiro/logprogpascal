"""Valida integracao dos projetos sem exigir a instalacao do Lazarus."""
from pathlib import Path
import re
import subprocess
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
projects = sorted(p for p in ROOT.glob('*/*.lpi') if p.parent.name != 'backup')
assert len(projects) == 11, 'Esperados 11 projetos'

for project in projects:
    config = ET.parse(project).getroot()
    for unit in config.findall('./ProjectOptions/Units/*'):
        path = project.parent / unit.find('Filename').attrib['Value']
        assert path.is_file(), f'{project}: unidade inexistente {path}'
    search = config.find('./CompilerOptions/SearchPaths/OtherUnitFiles')
    assert search is not None, f'{project}: caminho comum ausente'
    for relative in search.attrib['Value'].split(';'):
        assert (project.parent / relative.replace('\\', '/')).is_dir()
    main = next(project.parent.glob('*.lpr'))
    source = main.read_text(encoding='utf-8-sig')
    forms = [u for u in config.findall('./ProjectOptions/Units/*')
             if u.find('ComponentName') is not None]
    assert len(forms) == 1, f'{main}: esperado um formulario principal'
    unit = project.parent / forms[0].find('Filename').attrib['Value']
    assert re.search(r'\b' + re.escape(unit.stem) + r'\b', source, re.I), (
        f'{main}: formulario configurado nao esta no programa'
    )
    assert unit.is_file(), f'{main}: unidade principal inexistente'
    source = unit.read_text(encoding='utf-8-sig')
    form = unit.with_suffix('.lfm')
    assert form.is_file(), f'{unit}: formulario inexistente'
    form_source = form.read_text(encoding='utf-8-sig')
    for event in re.findall(r'\bOn\w+\s*=\s*(\w+)', form_source):
        assert re.search(r'procedure\s+TForm1\.' + re.escape(event) + r'\b', source, re.I), (
            f'{form}: evento sem implementacao {event}'
        )
    for component in re.findall(r'^  object (\w+): \w+', form_source, re.M):
        assert re.search(r'\b' + re.escape(component) + r'\s*:', source, re.I), (
            f'{form}: componente sem campo {component}'
        )

for doc in [ROOT / 'README.md', ROOT / 'exercicio01/README.md']:
    for relative in re.findall(r'\]\(([^)]+)\)', doc.read_text(encoding='utf-8')):
        assert (doc.parent / relative).exists(), f'{doc}: link inexistente {relative}'

tracked = subprocess.check_output(['git', 'ls-files', '-z'], cwd=ROOT).decode().split('\0')
for name in filter(None, tracked):
    path = Path(name)
    assert not ({'lib', 'backup'} & set(path.parts)), f'Artefato ainda versionado: {name}'
    assert path.suffix not in {'.lps', '.bak', '.o', '.obj', '.ppu', '.compiled'}

print(f'OK: {len(projects)} projetos, formularios, eventos, links e arquivos versionados.')
