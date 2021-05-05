//
//  MovieDummy.swift
//  moviesappTests
//
//  Created by Matheus de Vasconcelos on 05/05/21.
//

@testable import Runner

extension Movie {

    static var dummy: Movie {
        return Movie(
            title: "Vingadores: Ultimato",
            description: "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.",
            coverURL: TestBundle.main.url(forResource: "AvengersEndgame", withExtension: "jpg") ?? URL(fileURLWithPath: ""))
    }

}

class TestBundle {
    static var main: Bundle {
        return Bundle(for: self)
    }
}
