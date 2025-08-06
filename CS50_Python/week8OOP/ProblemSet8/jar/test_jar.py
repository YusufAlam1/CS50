from jar import Jar
import pytest

def test_init():
    jar1 = Jar()
    assert jar1.capacity == 1
    assert jar1.size == 0
    with pytest.raises(ValueError):
        Jar(-1)


def test_str():
    jar = Jar(2)
    assert str(jar) == ""
    jar.deposit(1)
    assert str(jar) == "🍪"


def test_deposit():
    jar = Jar(100)
    jar.deposit(5)
    assert jar.size == 5
    jar.deposit(20)
    assert jar.size == 25
    with pytest.raises(ValueError):
        jar.deposit(110)


def test_withdraw():
    jar = Jar(100)
    jar.deposit(50)
    jar.withdraw(5)
    assert jar.size == 45
    with pytest.raises(ValueError):
        jar.withdraw(50)