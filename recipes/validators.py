from django.core.exceptions import ValidationError


def validate_file_size(image):
    """Устанавливает максимальный размер для загружаемого на сайт изображения
    """
    filesize = image.size
    if filesize > 500000:  # размер изображения в битах
        raise ValidationError(
            message=f"Размер загружаемого файла составляет\
            {round(filesize / 1000000, 1)} Мбайт. Максимальный размер\
            изображения не должен превышать  0.5 Мбайт",
        )
    else:
        return image
