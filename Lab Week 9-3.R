pdf(file="half sphere.pdf")
x <- matrix(rep(seq(-5, 5, length= 100),100),100,100)
y <- t(x)
f <- function(x, y) { r <- sqrt((25-x^2-y^2)*(25-x^2+-y^2>0)) }
z <- f(x,y)
z[z==0] <- NA

persp(x[,1], y[1,], z, theta = 0, phi = 0, expand = 1, col = "red", xlab="x", ylab="y", zlab="z")
contour(z)
image(z)
contour(z, add=TRUE)



x <- runif(100, min=-1, max=1)
y <- runif(100, min=-1, max=1)
z <- 1 + x + 2 * y + rnorm(100)
reg <- lm(z~x+y)

x1<-matrix(rep(seq(-1, 1, length=10),10), 10, 10)
y1<-t(x1)
zhat<-reg$coefficients[1]+reg$coefficients[2]*x1+reg$coefficients[3]*y1

surface <- persp(x1[,1], y1[1,], zhat, theta = 0, phi = 0, expand = 1, col = heat.colors(30))
surface
xy.list = trans3d(x, y, z, surface)
points(xy.list, pch=20, col=heat.colors(10))
dev.off()