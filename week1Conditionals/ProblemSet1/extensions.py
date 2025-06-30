def main():
    file = input("File name: ").lower().strip()

    if "." not in file:
        print("application/octet-stream")
        return

    fileName, fileType = file.split(".", 1)
    if "gif" in file or "png" in file:
        print("image/" + fileType)
    elif "jpeg" in file or "jpg" in file:
        print("image/jpeg")
    elif "txt.pdf" in file:
        print("application/pdf")
    elif "pdf" in file or "zip" in file:
        print("application/" + fileType)
    elif "txt" in file:
        print("text/plain")
    else:
        print("application/octet-stream")


main()