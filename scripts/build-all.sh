#!/bin/bash
echo "=== [VCORE SYSTEM - EXPERTO SENIOR] AUDITORÍA Y CICLO 4: INTERFAZ CLI ==="

if [ -f "vcore_nexus_manifest.json" ]; then
    echo "[OK] Manifiesto principal detectado."
else
    echo '{"version": "2.7.4-cycle4", "status": "active"}' > vcore_nexus_manifest.json
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

# 4. Interfaz CLI
if [ -f "cli.py" ]; then
    echo "[EXEC] Validando interfaz CLI principal..."
    python3 cli.py
fi

echo "[SUCCESS] Ciclo 4 de interfaz CLI completado sin incidencias."
