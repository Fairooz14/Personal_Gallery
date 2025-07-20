# Personal Gallery 

A **minimal-beige, glass-morphism** mobile gallery that lets users  
- **upload images**  
- **add labels**  
- **view them in a grid & full-screen**

---
## Overview 
<img width="1603" height="1506" alt="photo_gallery_project" src="https://github.com/user-attachments/assets/341acc65-921d-474a-b6e1-0207b3dc96cf" />


---

##  Features
| Screen | What it does |
|--------|--------------|
| **Home** | Welcome page with two glass-morphism buttons |
| **Gallery** | 2-column grid of thumbnails → tap for full-screen |
| **Add Image** | Pick image, add label, compress + save to Firestore |

---

## Tech Stack
| Layer | Choice |
|-------|--------|
| **Frontend** | Flutter |
| **State Mgmt** | GetX |
| **Backend** | Cloud Firestore |
| **Images** | Base64 strings (≤ 1 MiB / doc) |
| **Architecture** | MVVM + Repository pattern |

---
