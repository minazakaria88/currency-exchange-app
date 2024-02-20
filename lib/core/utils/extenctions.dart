

import 'package:flutter/material.dart';

extension Width on double
{
  SizedBox get width=>SizedBox(width: this,);
}

extension Height on double
{
  SizedBox get height=>SizedBox(height: this,);
}