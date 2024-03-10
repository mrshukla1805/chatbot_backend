
# Doctor's Office API

This API provides functionalities for managing doctors and appointments.

## Endpoints

### Add a New Doctor

- **URL**: `https://us-central1-proven-gasket-416318.cloudfunctions.net/doctors/doctors`
- **Method**: `POST`
- **Request Body**: JSON
  ```json
  {
      "doc_name": "Dr. John Doe"
  }
  ```
- **Example**:
  ```bash
    curl -X POST -H "Content-Type: application/json" -d "{\"doc_name\": \"Dr. John Doe\"}" https://us-central1-proven-gasket-416318.cloudfunctions.net/doctors/doctors
  ```

### Fetch Appointments for a Doctor

- **URL**: `https://us-central1-proven-gasket-416318.cloudfunctions.net/doctors/doctors/{doctorId}/slot`
- **Method**: `GET`
- **Example**:
  ```bash
  curl https://us-central1-proven-gasket-416318.cloudfunctions.net/doctors/doctors/{doctorId}/slot
  ```

### Book a Slot for a Doctor

- **URL**: `https://us-central1-proven-gasket-416318.cloudfunctions.net/doctors/doctors/{doctorId}/slot/book/{slotId}`
- **Method**: `POST`
- **Example**:
  ```bash
  curl -X POST -H "Content-length: 0" https://us-central1-proven-gasket-416318.cloudfunctions.net/doctors/doctors/1/slot/book/1
  ```

### Reset All Booked Appointments

- **URL**: `https://us-central1-proven-gasket-416318.cloudfunctions.net/doctors/appointments/reset`
- **Method**: `POST`
- **Example**:
  ```bash
   curl -X POST -H "Content-Length: 0" https://us-central1-proven-gasket-416318.cloudfunctions.net/doctors/appointments/reset
  ```
