# Cambios personalizados en Bootstrap (CV - José Manuel Sánchez Rosal)

## 🎨 Variables sobrescritas en `custom.scss`

| Variable              | Valor personalizado     | Descripción                            |
|-----------------------|--------------------------|-----------------------------------------|
| `$primary`            | `#4CAF50`                | Color principal                         |
| `$secondary`          | `#FF9800`                | Color secundario                        |
| `$body-bg`            | `#f2f2f2`                | Fondo general del `body`               |
| `$body-color`         | `#333333`                | Color de texto base                    |
| `$font-family-base`   | `'Segoe UI', sans-serif` | Fuente base para todo el sitio         |
| `$border-radius`      | `0.75rem`                | Bordes redondeados para botones/cards  |
| `$container-max-widths` | `md: 720px, lg: 960px, xl: 1140px` | Ancho máximo de contenedores |

## ✅ Objetivo

Evitar la edición manual en HTML y CSS. Toda la personalización se hace en SASS para mantener un diseño coherente y profesional sin duplicar estilos.

## 🛠️ Compilación

```bash
sass scss/custom.scss css/custom.css
