// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaTurquia
 * @dev Registro de tecnicas de laminado de masa y gestion termica de proteinas.
 * Serie: Sabores de Asia (#1)
 */
contract CulturaTurquia {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 espesorCapaMicras;    // Calidad del laminado (1-500)
        uint256 saturacionAromatica;  // Intensidad de especias/almibar (1-10)
        bool usaMantequillaClarificada; // Lipido de transferencia de calor
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Baklava (Ingenieria del Laminado)
        registrarPlato(
            "Baklava", 
            "Masa filo, pistachos, mantequilla, almibar de azucar/miel.",
            "Superposicion de 40+ capas de masa micrometrica con sellado lipidico y choque termico de almibar.",
            50, 
            9, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _espesor, 
        uint256 _saturacion,
        bool _lipido
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            espesorCapaMicras: _espesor,
            saturacionAromatica: _saturacion,
            usaMantequillaClarificada: _lipido,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
