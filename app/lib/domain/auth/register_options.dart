import 'package:api_bindings/api_bindings.dart' as api;

class RegisterOptions({
  required final api.AnonymousRegister anonymousRegister,
  required final PasswordOptions password,
}) {
  factory RegisterOptions.fromDto(api.RegisterOptionsDto dto) {
    return RegisterOptions(
      anonymousRegister: dto.anonymousRegister,
      password: PasswordOptions.fromDto(dto.password),
    );
  }
}

class const PasswordOptions({
  required final int requiredLength,
  required final int requiredUniqueChars,
  required final bool requireNonAlphanumeric,
  required final bool requireLowercase,
  required final bool requireUppercase,
  required final bool requireDigit,
}) {
  factory PasswordOptions.fromDto(api.PasswordOptions dto) {
    return PasswordOptions(
      requiredLength: dto.requiredLength!,
      requiredUniqueChars: dto.requiredUniqueChars!,
      requireNonAlphanumeric: dto.requireNonAlphanumeric!,
      requireLowercase: dto.requireLowercase!,
      requireUppercase: dto.requireUppercase!,
      requireDigit: dto.requireDigit!,
    );
  }
}
