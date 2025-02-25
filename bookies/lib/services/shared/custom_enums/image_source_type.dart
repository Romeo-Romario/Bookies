enum ImageSourceType { asset, local }

ImageSourceType fromBooleanToImageSourceType(bool value) {
  switch (value) {
    case true:
      return ImageSourceType.local;
    case false:
      return ImageSourceType.asset;
  }
}
