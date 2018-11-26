import java.util.Calendar;
int daysInYear(int year) {
  Calendar cal = Calendar.getInstance();
  cal.set(Calendar.YEAR, year);
  return cal.getActualMaximum(Calendar.DAY_OF_YEAR);
}
