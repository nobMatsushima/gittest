helloworld = ->
    console.log "Hello"
    console.log "World"

helloworld()

add = (a,b) -> a+b

sum = add(20,30)

console.log sum

tommy = "トミー"
console.log "僕の名前は，#{tommy}"

setTimeout ->
    console.log "1秒後にトミーが"
, 1000

week = ['日','月','火','水','木','金','土']

weekdays = week[1..5]

for i in [0..3]
    console.log "#{weekdays[i]}曜日はトミーが笑いまくる"

weekdays.forEach (wday) ->
    console.log "#{wday}曜日"

numbers = [1..20]

for num in numbers
    if num%3 == 0
        console.log "アホ！"
    else
        console.log "#{num}"

persons =
    tommy:
        name: "トミー"
        age: 20
        birth: "10/14"
    gami:
        name: "ガミ"
        age: 22
        birth: "9/4"

console.log persons.gami.name

class Person
    constructor: (@name, @age=0) ->

    speak: ->
        console.log "#{@name} speaks"

tommy = new Person "トミー",20
gami = new Person "ガミ"
console.log tommy.age
gami.speak()