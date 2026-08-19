#!/usr/bin/env python3
import os
import shutil
import zipfile

print("--- V-CORE NEXUS: MOTOR DE EMPAQUETADO Y DISTRIBUCIÓN ---")
dist_dir = "dist"
os.makedirs(dist_dir, exist_ok=True)
release_name = "vcore-grid-suite-distribution-v2.8.0"
archive_path = os.path.join(dist_dir, release_name)

# Archivos y carpetas a empaquetar
items_to_pack = ["core", "security", "historical_archive", "scripts", "cli.py", "vcore_nexus_manifest.json"]

shutil.make_archive(archive_path, 'zip', '.', root_dir='.')
print(f"[DIST] Paquete de distribución generado con éxito: {archive_path}.zip")
print("-" * 54)
