# Shor's 9-Qubit Error Correction Code

> **Category**: error-correction &nbsp;|&nbsp; **Difficulty**: advanced &nbsp;|&nbsp; **Qubits**: 9 &nbsp;|&nbsp; **Gates**: 9 &nbsp;|&nbsp; **Depth**: 4

Shor's 9-qubit code combines a phase-flip outer code with three bit-flip inner codes to protect against any single-qubit error (bit-flip, phase-flip, or both). It was the first quantum error-correcting code discovered. The encoding circuit transforms one logical qubit q[0] into a 9-qubit codeword distributed across q[0..8]. This circuit implements only the encoding; syndrome measurement and correction require ancilla qubits and are omitted for clarity.

## Expected Output

9-qubit encoded state (no measurement — encoding only)

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
OPENQASM 2.0;
include "qelib1.inc";
// Shor's 9-qubit code: encoding circuit
// q[0]: logical data qubit (input), q[1..8]: physical ancilla qubits
qreg q[9];
// Phase-flip outer code: spread to groups of 3
cx q[0],q[3];
cx q[0],q[6];
// Switch to X basis for phase-flip protection
h q[0]; h q[3]; h q[6];
// Bit-flip inner codes: each X-basis qubit gets 3-fold repetition
cx q[0],q[1]; cx q[0],q[2];
cx q[3],q[4]; cx q[3],q[5];
cx q[6],q[7]; cx q[6],q[8];
```

## Tags

`error-correction` `shor-code` `fault-tolerant` `9-qubit`

## References

- [Shor, P.W. (1995). Scheme for reducing decoherence in quantum computer memory. PRA 52(4), R2493](https://doi.org/10.1103/PhysRevA.52.R2493)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
