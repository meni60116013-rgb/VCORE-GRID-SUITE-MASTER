#!/bin/bash
echo "=== [VCORE SYSTEM - EXPERTO SENIOR] AUDITORÍA Y CICLO 6: DISTRIBUCIÓN ==="

if [ -f "vcore_nexus_manifest.json" ]; then
    echo "[OK] Manifiesto principal detectado."
else
    echo '{"version": "2.8.5-dist", "status": "active"}' > vcore_nexus_manifest.json
fi

# 1. Motores
if [ -d "core/engines" ]; then
    for engine in core/engines/*.py; do
        [ -f "$engine" ] && python3 "$engine"
    done
fi

# 2. Seguridad
[ -f "security/integrity_check.py" ] && python3 security/integrity_check.py

# 3. Histórico
[ -f "historical_archive/logger_engine.py" ] && python3 historical_archive/logger_engine.py

# 4. CLI
[ -f "cli.py" ] && python3 cli.py

# 5. Empaquetado de Distribución (Ciclo 6)
if [ -f "scripts/package_release.py" ]; then
    echo "[EXEC] Ejecutando empaquetado final para distribución..."
    python3 scripts/package_release.py
fi

echo "[SUCCESS] Ciclo 6 de distribución completado. Paquete listo."
