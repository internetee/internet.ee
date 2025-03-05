Konva.Shape.prototype.reposition = function () {
	this.x(this.x() + this.offsetX());
	this.y(this.y() + this.offsetY());
}
Konva.Group.prototype.reposition = function () {
	this.x(this.x() + this.offsetX());
	this.y(this.y() + this.offsetY());
}
Konva.Shape.prototype.cacheMe = function (distance = 10) {
	var el = this
	el.cache({
		x: -distance,
		y: -distance,
		width: el.width() + (distance * 2),
		height: el.height() + (distance * 2)
	})
}

Konva.Shape.prototype.scaleMe = function (scale) {

	this.scale({ x: scale, y: scale })
}