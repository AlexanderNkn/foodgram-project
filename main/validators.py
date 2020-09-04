from django.core.exceptions import ValidationError


def validate_file_size(image):
    """Устанавливает максимальный размер для загружаемого на сайт изображения
    """
    filesize = image.size
    if filesize > 524288:
        raise ValidationError(
            message=f"Размер загружаемого файла составляет\
            {round(filesize / (1024 * 1024), 1)} Мбайт. Максимальный размер\
            изображения не должен превышать  0.5 Мбайт",
        )
    else:
        return image
