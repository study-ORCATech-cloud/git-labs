# Sample Python file for Git hooks lab
# This file demonstrates Python code that will be checked by the hooks

def main():
    """
    Main function that prints a welcome message
    """
    print("Welcome to the Git Hooks Lab!")
    print("This file will be used to test various Git hooks.")
    
    # Calculate and print a simple sequence
    print("Generating a sequence of numbers:")
    for i in range(1, 6):
        print(f"  {i}: {i * i}")
    
    print("Script execution complete.")


if __name__ == "__main__":
    main() 