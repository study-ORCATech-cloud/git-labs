import datetime
import os

def main():
    """
    Sample Python script for the GitHub Actions lab.
    """
    print("==================================================")
    print("            GitHub Actions Demo Script            ")
    print("==================================================")
    print(f"Current date and time: {datetime.datetime.now()}")
    print(f"Script executed by GitHub Actions runner")
    
    # Display environment variable if available
    greeting = os.environ.get('GREETING', 'No greeting environment variable set')
    print(f"Greeting: {greeting}")
    
    # Display some system information
    print("\nSystem Information:")
    print(f"Python version: {os.sys.version}")
    print(f"Platform: {os.sys.platform}")
    
    print("\nScript execution completed successfully!")
    print("==================================================")

if __name__ == "__main__":
    main() 