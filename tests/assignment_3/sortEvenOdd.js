function sortEvenOdd(arr){
    // pisahkan genap dan ganjil
    const evens = arr.filter(num => num % 2 === 0).sort((a, b) => b - a); // descending
    const odds = arr.filter(num => num % 2 !== 0).sort((a, b) => b - a); // descending
    // gabungkan genap lalu ganjil
    return [...evens,...odds];
}
const input = [3,2,5,1,8,9,6]
const ouput = sortEvenOdd(input);
console.log(ouput);

// run = node tests/assignment_3/sortEvenOdd.js