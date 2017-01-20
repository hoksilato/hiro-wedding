Master
[![build status](https://gitlab.com/hoksilato/hiro-wedding/badges/master/build.svg)](https://gitlab.com/hoksilato/hiro-wedding/commits/master)
[![coverage report](https://gitlab.com/hoksilato/hiro-wedding/badges/master/coverage.svg)](https://gitlab.com/hoksilato/hiro-wedding/commits/master)

Develop:
[![build status](https://gitlab.com/hoksilato/hiro-wedding/badges/develop/build.svg)](https://gitlab.com/hoksilato/hiro-wedding/commits/develop)
[![coverage report](https://gitlab.com/hoksilato/hiro-wedding/badges/develop/coverage.svg)](https://gitlab.com/hoksilato/hiro-wedding/commits/develop)

Frontend
========

Mỗi người sẽ nhận được 1 thiệp mời, trong thiệp mời sẽ có 1 card, trên card có:
- QR code (chứa link bên dưới)
- Link
- Code


Vào link trên:
* Nếu chưa đăng ký thì sẽ hiện form để nhập
  - Code (mặc định nhập nếu vào bằng QR code hoặc link)
  - Số người tham gia
* Nếu đã đăng ký thì hiện các thông tin
  - Tên
  - Số người tham gia
  - Số bàn


Backend
=======

* Các field khác của User
  - Code
  - Tên
  - Group
  - Số người tham gia
  - Số bàn
  - Note
* CRUD
* Import
* Export
* Statistics

Guide
=====

Import
------

* Nếu cột ID có giá trị sẽ ghi đè lên với giá trị mới.
* Tên group (Group name) phải chính xác như các groups đã có trong hệ thống.
