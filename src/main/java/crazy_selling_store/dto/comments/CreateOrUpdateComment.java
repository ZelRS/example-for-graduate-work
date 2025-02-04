package crazy_selling_store.dto.comments;

import lombok.Data;

import javax.validation.constraints.Size;

/**
 * DTO для работы по созданию или обновлению комментария
 */
@Data
public class CreateOrUpdateComment {
    @Size(min = 8, max = 64)
    private String text;
}
