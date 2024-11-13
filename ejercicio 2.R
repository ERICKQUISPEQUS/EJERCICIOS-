# Cargar librerías necesarias
library(ggplot2)

# Definir los datos
X <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)  # Horas de estudio
Y <- c(50, 55, 60, 62, 65, 70, 75, 80, 85, 90)  # Puntuación en el examen

# Ajustar el modelo de regresión lineal
modelo <- lm(Y ~ X)

# Obtener las predicciones del modelo
Y_pred <- predict(modelo)

# Calcular el coeficiente de determinación R^2
r2 <- summary(modelo)$r.squared
cat(sprintf("Coeficiente de correlación (R^2): %.2f\n", r2))

# Crear gráfico
data <- data.frame(X, Y, Y_pred)  # Crear un data.frame para facilitar el gráfico
ggplot(data, aes(x = X, y = Y)) +
  geom_point(color = "blue", size = 3) +  # Puntos de datos observados
  geom_line(aes(x = X, y = Y_pred), color = "red", size = 1.5, linetype = "solid") +  # Línea de regresión
  labs(
    title = "Regresión lineal: Puntuación vs Horas de estudio",
    x = "Horas de estudio",
    y = "Puntuación en el examen"
  ) +
  theme_minimal() +
  theme(legend.position = "none")  # Eliminar leyenda, ya que no es necesaria
