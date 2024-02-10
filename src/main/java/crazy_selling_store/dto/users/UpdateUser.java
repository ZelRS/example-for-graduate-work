package crazy_selling_store.dto.users;

import lombok.Data;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

//DTO для обновления данных пользователя
@Data
public class UpdateUser {
    @Size(min = 3, max = 10)
    private String firstName;
    @Size(min = 3, max = 10)
    private String lastName;
    @Pattern(regexp = "\\+7\\s?\\(?\\d{3}\\)?\\s?\\d{3}-?\\d{2}-?\\d{2}")
    private String phone;
}
