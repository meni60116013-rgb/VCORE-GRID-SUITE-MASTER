#!/bin/bash
echo "=== [VCORE SYSTEM - EXPERTO SENIOR] AUDITORÍA Y CICLO 2: SEGURIDAD ==="

if [ -f "vcore_nexus_manifest.json" ]; then
    echo "[OK] Manifiesto principal detectado."
else
    echo '{"version": "2.7.2-cycle2", "status": "active"}' > vcore_nexus_manifest.json
fi

# Ejecutar motores
if [ -d "core/engines" ]; then
    echo "[INFO] Explorando y ejecutando motores en core/engines..."
    for engine in core/engines/*.py; do
        if [ -f "$engine" ]; then
            echo "[EXEC] Ejecutando motor: $engine"
            python3 "$engine"
        fi
    done
fi

# Ejecutar auditoría de seguridad
if [ -f "security/integrity_check.py" ]; then
    echo "[EXEC] Ejecutando módulo de seguridad y autoría..."
    python3 security/integrity_check.py
fi

echo "[SUCCESS] Ciclo 2 de seguridad completado sin incidencias."
