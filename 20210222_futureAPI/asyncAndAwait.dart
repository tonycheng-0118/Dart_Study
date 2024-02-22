import 'dart:async';

String countUp(int count) {
  print('start count up');
  StringBuffer sb = new StringBuffer();

  if (count > 500) {
    throw new Exception('Over 500 not allowed.');
  } else {
    for (int i = 0; i < count; i++) {
      sb.write("${i}");
    }
  }
  print('finish count up');
  return sb.toString();
}

Future<String> createFutureCounter(int count) {
  return new Future(() {
    return countUp(count);
  });
}

void countUpAsync(int count) async {
  print('Async operation start');
  try {
    String value = await createFutureCounter(count);
    print('Async operation succeeded: ${value}');
  } catch (ex) {
    print('Async operation errored: ${ex}}');
  }
}

void main() {
  print('start main');
  // Future<String> future = createFutureCounter(100);
  countUpAsync(1000);
  // future.then((value) => handleCompletion(value));
}

void handleError(err) {
  print('Async operation error:${err}');
}

void handleCompletion(value) {
  print('Async operation succeeded: ${value}');
}
