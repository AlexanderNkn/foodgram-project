from django import forms


def validate_file_size(image):
    """Устанавливает максимальный размер для загружаемого на сайт изображения
    """
    filesize = image.size
    if filesize > 5242880:
        raise forms.ValidationError(
            message=f"Размер загружаемого файла составляет\
            {round(filesize / (1024 * 1024), 1)} Мбайт. Максимальный размер\
            изображения не должен превышать  5 Мбайт",
        )
    else:
        return image
