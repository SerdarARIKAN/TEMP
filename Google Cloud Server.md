# 🌐 Sunucu Konfigürasyonu ve Yerel PC Hazırlıkları

---

## 1️⃣ Sunucu Altyapısı

- **Platform:** Google Cloud Compute Engine
- **Makine Tipi:** n1-standard-4 (4 vCPU, 15 GB RAM)
- **Disk:** 256 GB SSD
- **OS:** Debian (Nested Virtualization destekli)
- **Nested Virtualization:** Etkin, Windows 11 ve Linux VM’leri çalıştırabilir
- **Network:** Özel ağ, HTTPS/HTTP portları yönlendirilmiş
- **Backup:** Disk snapshot ve Nextcloud üzerinde yedekleme

---

## 2️⃣ Domain ve Erişim

- **Ana Domain:** `gᴏᴑgle.com`
- **Ek Domainler:** `serdararikan.com`, `aratarikan.com`
- **Güvenlik:**
  - Tüm ana sayfa erişimleri kullanıcı adı + parola ile korunacak
  - Girişler loglanacak
- **Ana Sayfa:** 
  - Tüm servislerin linklerini barındıran bir portal
  - Linkler aracılığıyla servis erişimi sağlanacak

---

## 3️⃣ Servisler ve Kullanım Amaçları

| Servis | Amaç | Kısıtlamalar / Püf Noktalar |
|--------|------|-----------------------------|
| **Guacamole** | Web üzerinden VM ve container’lara erişim | Windows 11 ve Linux VM’ler için RDP/VNC desteği, performans ağ hızına bağlı |
| **Pi-hole** | Reklam ve tracker engelleme | DNS portu (53) yönlendirilmiş olmalı |
| **OpenVPN / PiVPN Web** | VPN bağlantısı | Maksimum 3 istemci, kullanıcı adı/parola ile koruma |
| **Jitsi Meet** | Video konferans | Sunucu CPU yükü yüksek olabilir, Docker container üzerinden çalıştırılır |
| **Nextcloud** | Dosya depolama, ISO/IMG sunumu | ISO/IMG’ler için HTTP/HTTPS üzerinden erişim; PXE/iPXE gerektirmez |
| **Portainer** | Docker container yönetimi | Yönetici yetkisi gerektirir |
| **Netdata** | Sistem monitoring | Ücretsiz, GUI üzerinden performans analizi |
| **WordPress + Mail Server** | `serdararikan.com`, `aratarikan.com`, `gᴏᴑgle.com` | Her domain kendi mail sunucusuna sahip; Nextcloud ile mail erişimi mümkün |
| **PXE/iPXE Server** | Eski donanımda boot | GCE üzerinde lokal ağ gerektirir; çoğu zaman WinPE veya HTTP/HTTPS boot daha mantıklı |
| **Windows 11 VM** | Nested virtualization ile çalıştırılacak | Guacamole üzerinden GUI erişimi mümkün; maksimum 2 VM aynı anda çalışacak |
| **Linux VM’ler** | Gerektiğinde çalıştırılacak | Çoğunlukla kapalı; kaynak kullanımı düşük |

---

## 4️⃣ Cloud Kaynak Önerisi (Minimum)

- **Compute Engine:** n1-standard-4
- **Disk:** 256 GB SSD
- **RAM:** 15 GB (Windows 11 + Linux VM’leri için yeterli)
- **CPU:** 4 vCPU (maksimum 2 VM aynı anda çalışacak şekilde)

---

## 5️⃣ Local PC Hazırlıkları (Windows 11 DISM + Partition)

### 5.1 Disk Partition Mantığı

- GPT tabanlı, UEFI uyumlu
- Partition planı (256 GB örneği):

| Partition | Boyut (2^n MB) | Açıklama | Harf |
|-----------|----------------|----------|------|
| EFI       | 4.096 MB       | UEFI boot | – |
| MSR       | 16 MB          | Microsoft Reserved | – |
| System    | 131.072 MB     | Windows 11 + Programlar | C |
| Data      | 65.536 MB      | Kullanıcı verisi | D |
| Recovery  | Kalan (~43.478 MB) | WinRE veya WinPE | R |

- Recovery partition **her zaman en sonda olacak** ve kalan alanı kapsayacak.
- Tüm boyutlar **2^n MB’ye yuvarlanmış**.
- DISKPART ile otomatik oluşturulabilir (batch + PowerShell scripti hazırlanabilir).

### 5.2 DiskPart Batch Örneği

- PowerShell ile disk boyutunu MB cinsinden alır, yüzdelik hesaplar ve 2^n’ye yuvarlar
- Son kalan alan Recovery olarak atanır
- DiskPart üzerinden otomatik uygulanır

```batch
:: DiskPart scripti örneği (özet)
diskpart /s diskpart_script.txt
