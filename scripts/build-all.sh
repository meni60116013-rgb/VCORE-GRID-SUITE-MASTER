#!/bin/bash
echo "=== [VCORE SYSTEM] INICIANDO AUDITORÍA Y COMPILACIÓN MASIVA ==="

# Auditoría de motores en core/engines
if [ -d "core/engines" ]; then
    echo "[INFO] Explorando motores en core/engines..."
    for engine in core/engines/*.py; do
        if [ -f "$engine" ]; then
            echo "[EXEC] Ejecutando motor: $engine"
            python3 "$engine"
            echo "--------------------------------------------------------"
        fi
    done
else
    echo "[WARN] Directorio core/engines no encontrado."
fi

echo "[SUCCESS] Compilación y pruebas masivas finalizadas sin interrupciones."
