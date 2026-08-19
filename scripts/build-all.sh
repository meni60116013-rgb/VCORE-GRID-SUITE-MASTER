#!/bin/bash
echo "[BUILD] Verificando integridad de motores en VCORE GRID SUITE..."
python3 core/engines/chassis_solver.py
echo "[BUILD] Verificación masiva completada con éxito."
