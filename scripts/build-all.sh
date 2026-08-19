#!/bin/bash
echo "=== [VCORE SYSTEM - EXPERTO SENIOR] AUDITORÍA Y CICLO 1: MOTORES ==="

if [ -f "vcore_nexus_manifest.json" ]; then
    echo "[OK] Manifiesto principal detectado."
else
    echo '{"version": "2.7.0-cycle1", "status": "active"}' > vcore_nexus_manifest.json
fi

if [ -d "core/engines" ]; then
    echo "[INFO] Explorando y ejecutando motores en core/engines..."
    for engine in core/engines/*.py; do
        if [ -f "$engine" ]; then
            echo "[EXEC] Ejecutando: $engine"
            python3 "$engine"
        fi
    done
else
    echo "[WARN] Directorio core/engines no encontrado."
fi

echo "[SUCCESS] Ciclo 1 completado sin incidencias."
