#!/bin/bash
echo "=== [VCORE SYSTEM - EXPERTO SENIOR] AUDITORÍA Y CICLO 3: HISTÓRICO ==="

if [ -f "vcore_nexus_manifest.json" ]; then
    echo "[OK] Manifiesto principal detectado."
else
    echo '{"version": "2.7.3-cycle3", "status": "active"}' > vcore_nexus_manifest.json
fi

# 1. Motores
if [ -d "core/engines" ]; then
    echo "[INFO] Explorando y ejecutando motores en core/engines..."
    for engine in core/engines/*.py; do
        if [ -f "$engine" ]; then
            echo "[EXEC] Ejecutando motor: $engine"
            python3 "$engine"
        fi
    done
fi

# 2. Seguridad
if [ -f "security/integrity_check.py" ]; then
    echo "[EXEC] Ejecutando módulo de seguridad y autoría..."
    python3 security/integrity_check.py
fi

# 3. Histórico y Trazabilidad
if [ -f "historical_archive/logger_engine.py" ]; then
    echo "[EXEC] Ejecutando motor de trazabilidad e histórico..."
    python3 historical_archive/logger_engine.py
fi

echo "[SUCCESS] Ciclo 3 de histórico y trazabilidad completado sin incidencias."
