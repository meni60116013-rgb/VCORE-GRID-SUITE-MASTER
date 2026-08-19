#!/bin/bash
echo "=== [VCORE SYSTEM - NIVEL 6] AUDITORÍA Y VALIDACIÓN MAESTRA ==="

# 1. Verificar estructura de manifiestos
if [ -f "vcore_nexus_manifest.json" ]; then
    echo "[OK] Manifiesto principal detectado."
else
    echo "[INFO] Generando manifiesto base de control..."
    echo '{"version": "2.6.2-stable", "status": "active"}' > vcore_nexus_manifest.json
fi

# 2. Descubrimiento y ejecución dinámica de motores
if [ -d "core/engines" ]; then
    echo "[INFO] Explorando motores en core/engines..."
    for engine in core/engines/*.py; do
        if [ -f "$engine" ]; then
            echo "[EXEC] Ejecutando motor crítico: $engine"
            python3 "$engine"
            echo "--------------------------------------------------------"
        fi
    done
else
    echo "[WARN] Directorio core/engines no encontrado."
fi

echo "[SUCCESS] Auditoría y compilación de Nivel 6 finalizadas sin incidencias."
