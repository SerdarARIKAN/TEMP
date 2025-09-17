# 🚀 Sunucu Konfigürasyonu Özet

Bu doküman, Google Cloud Compute Engine üzerinde çalışacak, tüm servisleri, domainleri, PXE/iPXE ve nested virtualization ile Windows 11 VM’i içeren tam konfigürasyonu özetler.

---

## 🖥️ 1. Sunucu Altyapısı

- **Platform:** Google Cloud Compute Engine  
- **Makine Tipi:** `n1-standard-4` (4 vCPU, 15 GB RAM)  
- **Disk:** 256 GB SSD  
- **İşletim Sistemi:** Debian (stabil)  
- **Özellikler:**  
  - Nested virtualization aktif → Windows 11 ve diğer VM’ler  
  - Statik IP → domainlerle eşleşecek  
  - Firewall: HTTP(S), VPN, PXE/TFTP portları açık  

---

## 🌐 2. Domain ve Erişim

- **Ana Domain:** `gᴏᴑgle.com` → Dashboard, WordPress ve mail  
- **Alt Domainler:**  
  - `serdararikan.com` → WordPress + mail  
  - `aratarikan.com` → WordPress + mail  
- **Ana Sayfa / Dashboard:** `https://gᴏᴑgle.com/`  
  - HTTP Basic Auth koruması  
  - Erişim logları NGINX tarafından kaydedilir  
- **Reverse Proxy + SSL:**  
  - NGINX + Let’s Encrypt  
  - Path veya subdomain tabanlı yönlendirme:  
    - `/guac` → Guacamole  
    - `/pihole` → Pi-hole  
    - `/meet` → Jitsi Meet  
    - `/vpn` → OpenVPN / PiVPN Web  
    - `/portainer` → Portainer  
    - `/netdata` → Netdata  
    - `/nextcloud` → Nextcloud  
    - `/serdararikan` → WordPress  
    - `/aratarikan` → WordPress  
    - `/` veya subdomain → Ana domain WordPress  

---

## 🛠️ 3. Servisler ve Kullanım Amaçları

| 🔹 Servis | 🎯 Amaç | 🌐 Path | ⚠️ Kısıtlamalar | 💡 Dikkat Edilecek Hususlar |
|-----------|---------|---------|----------------|----------------------------|
| **Dashboard** | Tüm servislerin merkezi erişimi | `/` | HTTP Basic Auth ile korunmalı | Girişler loglanmalı; linkler doğru yönlendirmeli |
| **Guacamole** | Uzak masaüstü (Windows/Linux) | `/guac` | RAM/CPU sınırlı | Nested virtualization VM’leri; SSL aktif |
| **Pi-hole** | DNS filtreleme | `/pihole` | Host DNS portu ile çakışmamalı | Web UI şifresi güçlü olmalı |
| **OpenVPN + PiVPN Web** | Güvenli VPN erişimi | `/vpn` | 3–4 kullanıcı için optimize | UDP 1194 açık olmalı; Web UI üzerinden kullanıcı yönetimi |
| **Jitsi Meet** | Video konferans | `/meet` | 3–4 kullanıcıdan fazla yük performansı düşürür | SSL sertifikası aktif |
| **Nextcloud** | Dosya paylaşımı, ISO/IMG, mail erişimi | `/nextcloud` | ISO/IMG disk alanı tüketir | PXE/iPXE entegrasyonu; mail için IMAP/SMTP; SSL |
| **Portainer** | Docker yönetimi | `/portainer` | Docker socket erişimi | Ana sayfa auth ile korunmalı |
| **Netdata** | Sistem/Container performansı izleme | `/netdata` | CPU/RAM yükü | Container ve sistem performansı izlenmeli |
| **PXE/iPXE** | ISO/IMG network boot | `/isos` / Nextcloud linki | ISO doğrudan boot çoğu zaman mümkün değil | DHCP + TFTP container kurulmalı; menü ile seçim |
| **Nested Virtualization (Windows 11 VM)** | Windows 11 çalıştırmak | - | CPU/RAM sınırlı | Guacamole ile erişim; PXE/iPXE veya ISO yükleme |
| **WordPress (serdararikan.com)** | Domain web sitesi | `/serdararikan` | Kaynak yoğun | Veritabanı container ile entegre; SSL aktif; güncelleme yapılmalı |
| **WordPress (aratarikan.com)** | Domain web sitesi | `/aratarikan` | Kaynak yoğun | Veritabanı container ile entegre; SSL aktif |
| **WordPress (gᴏᴑgle.com)** | Ana domain web sitesi | `/` | Kaynak yoğun | Veritabanı container ile entegre; SSL aktif |
| **Mail Sunucuları** | Kendi domain mail yönetimi | - | MX/SPF/DKIM/SPF gerektirir | Docker mail server veya Postfix/Dovecot; Nextcloud Mail entegrasyonu |

---

## ⚡ 4. Cloud Kaynak Önerisi (Minimum)

- **vCPU:** 4  
- **RAM:** 15 GB  
- **Disk:** 256 GB SSD  
- **Ağ:** Statik IP, domain ve firewall uyumlu  

---

## 🔄 5. Özet Akış

1. Kullanıcı `https://gᴏᴑgle.com/` → Basic Auth giriş  
2. Ana sayfa üzerinden tüm servisler erişilebilir  
3. PXE/iPXE menüsü → ISO/IMG network boot  
4. Nested virtualization içinde Windows 11 VM çalışır → Guacamole ile erişim  
5. WordPress siteleri kendi domainlerinden çalışır  
6. Domain mail sunucuları aktif → Nextcloud Mail app ile erişim  
7. Nextcloud → Dosya paylaşımı, ISO/IMG barındırma ve mail istemcisi  

---

## ✅ Püf Noktaları ve Öneriler

- Tüm servisler **Docker Compose** ile yönetilmeli  
- Ağ yapısı: `proxy` (Reverse Proxy + SSL), `internal` (Containerlar arası)  
- SSL sertifikaları Let’s Encrypt ile tüm domainler için aktif  
- ISO/IMG network boot için PXE/iPXE script menüsü oluşturulmalı  
- Nested virtualization VM’leri diğer containerlardan kaynak paylaşımı açısından dikkatlice planlanmalı  
- Mail sunucularında MX/SPF/DKIM ayarları yapılmalı, spam ve blacklist sorunlarına dikkat edilmeli  
- Ana sayfa ve servis erişim logları düzenli kontrol edilmeli  

---

