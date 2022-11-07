function suma(num1,num2){
    return num1 +num2;
}

function resta(num1,num2){
    return num1 - num2;
}

const calculadora = {
    suma:suma,
    resta:resta,
}

module.exports = calculadora;