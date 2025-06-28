package com.makassar.myproject

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.graphics.RectF
import android.graphics.Region
import android.os.Build
import android.util.AttributeSet
import android.view.View

class OvalView(context: Context, attrs: AttributeSet) : View(context, attrs) {
    private val paint = Paint()
    private val ovalRect = RectF()
    private val blurPaint = Paint()
    private val ovalPath = Path()

    init {
        paint.apply {
            color = Color.RED
            style = Paint.Style.STROKE
            strokeWidth = 15f
        }
        blurPaint.apply {
            isAntiAlias = true
            color = Color.BLACK
            style = Paint.Style.FILL
            alpha = 128
        }

    }

    fun getOvalRect() = ovalRect
    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)

        val centerX = width / 2
        val centerY = height / 2.8
        val radiusX = width / 2.5
        val radiusY = height / 3.8

        ovalRect.set(
            (centerX - radiusX).toFloat(),
            (centerY - radiusY).toFloat(),
            (centerX + radiusX).toFloat(),
            (centerY + radiusY).toFloat()
        )

        // The following code adjusts the outer part of the rectangle shape to be slightly blurred and the inner part to be transparent.
        ovalPath.addOval(ovalRect, Path.Direction.CCW)
        if (Build.VERSION.SDK_INT >= 26) {
            canvas?.clipOutPath(ovalPath)
        } else {
            @Suppress("DEPRECATION") canvas?.clipPath(ovalPath, Region.Op.DIFFERENCE)
        }
        canvas?.drawPaint(blurPaint)
//        canvas?.drawOval(ovalRect, paint)
    }
}