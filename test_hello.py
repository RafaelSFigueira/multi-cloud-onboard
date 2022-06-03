from hello import add, subtract


def test_add():
    assert 3 == add(1, 2)
    
def test_subtract():
    assert 1 == subtract(2, 1)
