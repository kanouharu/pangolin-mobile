// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of vector_math_64;

/// 2D dot product.
double dot2(Vector2 x, Vector2 y) => x.dot(y);

/// 3D dot product.
double dot3(Vector3 x, Vector3 y) => x.dot(y);

/// 3D Cross product.
void cross3(Vector3 x, Vector3 y, Vector3 out) {
  x.crossInto(y, out);
}

/// 2D cross product. vec2 x vec2.
double cross2(Vector2 x, Vector2 y) => x.cross(y);

/// 2D cross product. double x vec2.
void cross2A(double x, Vector2 y, Vector2 out) {
  var tempy = x * y.x;
  out.x = -x * y.y;
  out.y = tempy;
}

/// 2D cross product. vec2 x double.
void cross2B(Vector2 x, double y, Vector2 out) {
  var tempy = -y * x.x;
  out.x = y * x.y;
  out.y = tempy;
}

/// Sets [u] and [v] to be two vectors orthogonal to each other and
/// [planeNormal].
void buildPlaneVectors(final Vector3 planeNormal, Vector3 u, Vector3 v) {
  if (planeNormal.z.abs() > Math.SQRT1_2) {
    // choose u in y-z plane
    double a = planeNormal.y * planeNormal.y + planeNormal.z * planeNormal.z;
    double k = 1.0 / Math.sqrt(a);
    u.x = 0.0;
    u.y = -planeNormal.z * k;
    u.z = planeNormal.y * k;
    v.x = a * k;
    v.y = -planeNormal[0] * (planeNormal[1] * k);
    v.z = planeNormal[0] * (-planeNormal[2] * k);
  } else {
    // choose u in x-y plane
    double a = planeNormal.x * planeNormal.x + planeNormal.y * planeNormal.y;
    double k = 1.0 / Math.sqrt(a);
    u.x = -planeNormal[1] * k;
    u.y = planeNormal[0] * k;
    u.z = 0.0;
    v.x = -planeNormal[2] * (planeNormal[0] * k);
    v.y = planeNormal[2] * (-planeNormal[1] * k);
    v.z = a * k;
  }
}

/// Base class for vectors
abstract class Vector {
  List<double> get storage;
}
