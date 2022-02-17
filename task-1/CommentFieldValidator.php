<?php

/**
 * Валидатор поля комментария, заполняемого пользователем, для обработки недопустимых html-тегов
 * 
 * Для повышения безопасности недостаточно будет удалить недопустимые html-теги.
 * Следует так же добавить защиту от xss-атак (межсайтовый скриптинг),
 * которые подразумевают внедрение вредоносного js-кода,
 * в основном для кражи куки пользователей
 * 
 * Так же возможно использования валидации значения поля по паттерну regex
 */
class CommentFieldValidator
{
    /**
     * Допустимые html-теги для поля комметария пользователя
     */
    protected const VALID_TAGS = ['<b>', '<i>', '<u>', '<ul>', '<ol>', '<img>', '<a>', '<hr>'];
    /**
     * обработанное валидное значение для сохранения комментария
     */
    protected string $comment_validated;

    /**
     * @param string $comment_raw_field сырое значение из поля комментария, заполненного пользователя.
     * например new CommentFieldValidator($_POST['field_Comment'])
     */
    public function __construct(
        protected string $comment_raw_field
    ) {
        $this->parseInput();
    }

    /**
     * Обработчик входящего значения из поля комментария пользователя
     * * удаляет лишние html-теги, оставляет только валидные
     * * экранирует спецсимволы для предотвращения xss-атак
     * 
     * Так же возможно добавить проверку поля по паттерну regex
     */
    protected function parseInput(): void
    {
        /**
         * удаляем лишние html-теги из комментария, оставляем только валидные
         */
        $this->comment_validated = strip_tags($this->getRaw(), self::VALID_TAGS);
        /**
         * экранируем спецсимволы для предотвращения xss-атак
         */
        $this->comment_validated = htmlspecialchars($this->comment_validated);
        return;
    }

    /**
     * возвращает сырое значение из поля комментария в виде строки
     */
    public function getRaw(): string
    {
        return $this->comment_raw_field;
    }

    /**
     * возвращает валидное значение из поля комметария в виде строки
     */
    public function getValid(): string
    {
        return $this->comment_field;
    }
}
