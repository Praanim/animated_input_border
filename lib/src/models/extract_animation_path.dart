import 'dart:ui';

class ExtractAnimationPath {
  /// Create Animation Path based on the value of animation
  ///
  static Path createAnimatedPath({
    required Path originalPath,
    required double animationPercent,
  }) {
    // compute the total length of the path in double
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    // compute the current length based on the animation percent
    // animation value runs from 0.0 to 1.0
    final currentLength = animationPercent * totalLength;

    // finally extract path based on the currentLength from the original path
    return _extractPathUntilLength(originalPath, currentLength);
  }

  /// Extracts path based on the given length from the original path
  ///
  static Path _extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    // create iterables of PathMetrics which contains info about the paths like length
    final metricsIterator = originalPath.computeMetrics().iterator;

    // run while loop until the iterables exhaust or break statement
    while (metricsIterator.moveNext()) {
      final metric = metricsIterator.current;

      final nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length; // length from animation value

      if (isLastSegment) {
        // if is last segment then calculate the remaining length and add to the cummulative current length
        // and extract path
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0,
            remainingLength); // creates new path using same metric but having
        // different starting and ending point

        // finally add last path segment to the path object created above
        path.addPath(pathSegment, Offset.zero);

        break;
      } else {
        // if the required length coming from animation value is not reached then keep on adding the path
        // to the path object above
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      // finally add the next length to current length
      currentLength = nextLength;
    }

    return path;
  }
}
