import ctypes
import json

def init():
    print("Wilkommen in den Einstellungen für ohg_auto_login! \n")

    print("Wähle eine der folgenden Aktionen aus: \n \t (1) Benutzerdaten ändern \n \t (2) Skript deinstallieren \n \t (3) Verlassen")
    action = input("Aktion angeben: ")

    if action == "1":
        change_username()
    elif action == "2":
        uninstall_program()
    elif action == "3":
        exit()
    else:
        print("Nicht unterstützte Aktion!")
        init()




def change_username():
    username = input("Gib deinen Benutzernamen ein: ")
    password = input("Gib dein Passwort ein: ")

    print("\n Sind diese Daten korrekt? \n \t Benutzername: {} \n \t Passwort: {}".format(username, password))

    answer = input("(J)a, (N)ein: ")

    if answer.lower() == "j":
        with open("config.json", "r") as f:
            content = json.loads(f.read())
        
        with open("config.json", "w") as f:
            data= [{"username": username, "password": password}]
            f.flush()
            json.dump(data, f)
            f.close()
        
        print("Benutzerdaten geändert!")
    
    else:
        print("Funktion wird erneut ausgeführt!")
        change_username()


def uninstall_program():
    print("Ein Helferprogramm wird nun das Skript deinstallieren! Drücke Enter zum fortfahren!")
    input()
    path = "C:\scripts\ohg_auto_login\windows_uninstaller.bat"
    ctypes.windll.shell32.ShellExecuteW(None, "runas", path, None, None, 1)
    exit()


if __name__ == "__main__":
    init()