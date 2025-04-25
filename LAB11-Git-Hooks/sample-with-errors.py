# Sample Python file with errors for Git hooks lab
# This file contains intentional errors to demonstrate how hooks can catch them

def main():
    """
    Main function with several intentional errors
    """
    print("This file contains errors that should be caught by Git hooks.")    
    
    # Error 1: Trailing whitespace on the next line
    x = 5   
    
    # Error 2: Missing colon in if statement
    if x > 3
        print("x is greater than 3")
    
    # Error 3: Undefined variable
    print(f"The value of y is: {y}")
    
    # Error 4: Debugging statement that should be removed
    print("DEBUG: This line should be caught by the pre-commit hook")
    
    # Error 5: Unused import
    import os
    
    # Error 6: Line too long (if you're using flake8 with default settings)
    print("This is a very long line that exceeds the recommended maximum line length for Python code according to PEP 8 guidelines")
    
    return "Execution complete"


if __name__ == "__main__":
    main()
    
# Error 7: Trailing whitespace at end of file 