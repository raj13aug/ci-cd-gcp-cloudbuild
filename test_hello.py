from hello import add

# Unit test - Generated with ChatGPT
def test_add():
    # Test case 1: Test with positive integers
    assert add(2, 3) == 5  # Expected result: 2 + 3 = 5
    
    # Test case 2: Test with negative integers
    assert add(-2, -3) == -5  # Expected result: -2 + (-3) = -5
    
    # Test case 3: Test with zero
    assert add(0, 0) == 0  # Expected result: 0 + 0 = 0
    
    # Test case 4: Test with decimal numbers
    assert add(2.5, 3.5) == 6.0  # Expected result: 2.5 + 3.5 = 6.0