float[] values;
int i, j = 0;

void setup() {
  size(1900, 900);
  values = new float[width];
  for (int i=0; i < values.length; i++) {
    values[i] = random(height);
    // values[i] = noise(i/142.234)*height;
  }
}

void draw() {
  background(0);
  line(255, 255, 255);
  quickSort(values, 0, values.length -1);
}

void quickSort(float[] arr, int start, int end) {
  if (start >= end) {
    return;
  }
    int index = partition(arr, start, end);
    quickSort(arr, start, index -1);
    quickSort(arr, index +1, end);
}

int partition(float[] arr, int start, int end) {
  int pivotIndex = start;
  float pivotValue = arr[end];
  for (int i=start; i < end; i++) {
    if (arr[i] < pivotValue) {
      swap(arr, i, pivotIndex);
      pivotIndex ++;
    }
  }
  swap(arr, pivotIndex, end);
  return pivotIndex;
}

void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

void line(float r, float g, float b) {
  for (int i=0; i < values.length; i++) {
    stroke(color(r, g, b));
    line(i, height, i, height - values[i]);
  }
}
