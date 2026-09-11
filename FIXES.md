# Correções

## 2026-09-11

- Corrigido erro de compilação em `DesktopController.kt` no callback padrão `notify`.
- Antes: `private val notify:(String,String)->Unit={}`
- Depois: `private val notify:(String,String)->Unit={ _, _ -> }`
- A correção resolve o erro do Kotlin: `Initializer type mismatch`, onde era esperado `Function2<String, String, Unit>` e era recebido `Function0<Unit>`.
