import pytest
from um import count

def test_yum():
    assert count("yum") == 0

def test_um():
    assert count("um...") == 1

def test_normal():
    assert count("hello, um, to, the, um, world") == 2