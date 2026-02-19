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
