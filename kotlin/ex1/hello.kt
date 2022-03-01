fun main(){
    println("Hello, World")
    // var a: Int = sum(5, 6)
    println(sum(7, 8))


    val person = Person("anpro", 20)

    person.age = 34
    //person.name = "kim"

    println(person)

    val b1 = Button(100)
    val b2 = Button(200, "ttt")
    println("b1(${b1.id}) : ${b1.text}")
    println("b2(${b2.id}) : ${b2.text}")


    val book = Book("Mongo", 200)
    val ebook = EBook("Sang", 300, "http:")
    book.printInfo()
    ebook.printInfo()

}

fun sum(a : Int, b: Int) : Int {
    return a + b
}

class Person(
    val name : String,
    var age : Int
)

class Button (var id: Int){
    var text: String = ""

    init {
        println("Initializer Block 1 : $id, $text")
    }
    constructor (id: Int, text: String) : this(id) {
        this.text = text
        println("Constructor(id, text) : ${this.id}, ${this.text}")
    }
    init {
        println("Initializer Block 2 : $id, $text")
    }
}

open class Book (val title: String, var price: Int) {
    open fun printInfo(){ 
        println("Title : $title, Price : $price")
    }
}

class EBook(title: String, price: Int, var url: String): Book(title, price){
    override fun printInfo(){ 
        println("Title: $title, Price: $price, URL: $url")
    }
}