<div align="center">

# 🚀 VeloSight

### An Interactive R Shiny Data Dashboard

[![Shiny](https://img.shields.io/badge/Shiny-Live%20App-blue?style=for-the-badge&logo=rstudio&logoColor=white)](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/)
[![R](https://img.shields.io/badge/R-4.3%2B-276DC3?style=for-the-badge&logo=r&logoColor=white)](https://www.r-project.org/)
[![Posit Connect Cloud](https://img.shields.io/badge/Deployed%20on-Posit%20Connect%20Cloud-447099?style=for-the-badge&logo=posit&logoColor=white)](https://connect.posit.cloud/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

[![GitHub last commit](https://img.shields.io/github/last-commit/mun9uk-ship-it/VeloSight?style=flat-square)](https://github.com/mun9uk-ship-it/VeloSight/commits/main)
[![GitHub repo size](https://img.shields.io/github/repo-size/mun9uk-ship-it/VeloSight?style=flat-square)](https://github.com/mun9uk-ship-it/VeloSight)
[![GitHub issues](https://img.shields.io/github/issues/mun9uk-ship-it/VeloSight?style=flat-square)](https://github.com/mun9uk-ship-it/VeloSight/issues)
[![ORCID](https://img.shields.io/badge/ORCID-0000--0000--0000--0000-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0000-0000-0000-0000)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.XXXXXXX-blue?style=flat-square&logo=zenodo&logoColor=white)](https://doi.org/10.5281/zenodo.XXXXXXX)

**[🌐 Try the Live Demo](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/)** • **[📂 View Source Code](https://github.com/mun9uk-ship-it/VeloSight)**

</div>

---

<div align="center">

<!-- 📸 Replace this with an actual screenshot: upload your image to a `docs/` or `assets/` folder in the repo and update the path below -->
<img src="docs/screenshot.png" alt="VeloSight Dashboard Screenshot" width="90%">

</div>

---

## 🌍 Language / اللغة

**[English](#-english)** | **[العربية](#-العربية)**

---

# 🇬🇧 English

## 📖 Overview

**VeloSight** is a modern, interactive data dashboard built with **R Shiny**. It lets users explore the classic `mtcars` dataset through dynamic filters, a live scatter plot, KPI summary cards, and a searchable data table — all wrapped in a sleek dark theme powered by `bslib`.

This project is designed as a lightweight, easy-to-deploy template for anyone getting started with interactive R dashboards on **Posit Connect Cloud**.

## ✨ Features

| Feature | Description |
|---|---|
| 🎚️ **Dynamic Filters** | Filter cars by horsepower range and number of cylinders |
| 📊 **Interactive Plot** | Hover-enabled scatter plot (via `plotly`) of MPG vs. Weight |
| 🚗 **KPI Cards** | Live-updating "Total Selected Cars" and "Average Horsepower" metrics |
| 📋 **Data Table** | Sortable, paginated table (via `DT`) of the filtered dataset |
| 🌙 **Modern Dark UI** | Built with `bslib`'s "darkly" Bootswatch theme |

## 🔴 Live Demo

Try VeloSight directly in your browser — no installation required:

### 👉 **[Launch VeloSight](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/)**

## 🖥️ How to Use It

1. Open the [live demo link](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/) above.
2. Use the **sidebar controls** on the left to:
   - Drag the **Horsepower Range** slider to filter cars by horsepower.
   - Check/uncheck the **Cylinders** boxes (4, 6, 8) to include or exclude car types.
3. Watch the **KPI cards** at the top update instantly with the filtered totals.
4. **Hover over points** on the scatter plot to see car details.
5. Use the **Data Table** on the right to sort columns or page through results.

## ⚙️ How to Run It Locally

### Prerequisites
- [R](https://cran.r-project.org/) (version 4.3 or later)
- [RStudio](https://posit.co/download/rstudio-desktop/) (recommended) or [Posit Cloud](https://posit.cloud/) (browser-based, no install needed)

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/mun9uk-ship-it/VeloSight.git
cd VeloSight
```

```r
# 2. Install required R packages
install.packages(c("shiny", "bslib", "ggplot2", "plotly", "DT", "bsicons"))

# 3. Run the app
shiny::runApp()
```

The app will automatically open in your default browser at `http://127.0.0.1:PORT`.

### 🚀 Deploying Your Own Copy to Posit Connect Cloud

```r
install.packages("rsconnect")
rsconnect::writeManifest()
```

Then commit and push the generated `manifest.json` to your GitHub repository, and connect it via **[Posit Connect Cloud](https://connect.posit.cloud/) → Publish → From GitHub**.

## 🛠️ Tech Stack

- **[R](https://www.r-project.org/)** — core language
- **[Shiny](https://shiny.posit.co/)** — reactive web framework
- **[bslib](https://rstudio.github.io/bslib/)** — modern Bootstrap theming
- **[ggplot2](https://ggplot2.tidyverse.org/)** + **[plotly](https://plotly.com/r/)** — interactive visualizations
- **[DT](https://rstudio.github.io/DT/)** — interactive data tables
- **[Posit Connect Cloud](https://connect.posit.cloud/)** — hosting & deployment

## 📁 Repository Structure

```
VeloSight/
├── app.R              # Main Shiny application (UI + server logic)
├── manifest.json       # Dependency manifest for Posit Connect Cloud
├── renv.lock            # Package version lockfile
├── LICENSE
├── README.md
└── project.Rproj
```

## 📚 Citation

If you use VeloSight in your research or work, please cite it as follows:

> _[Author Name]._ (2026). **VeloSight: An Interactive R Shiny Data Dashboard** [Software]. Zenodo. https://doi.org/10.5281/zenodo.XXXXXXX

- **ORCID:** [https://orcid.org/0000-0000-0000-0000](https://orcid.org/0000-0000-0000-0000) <!-- Replace with your ORCID iD -->
- **Zenodo Archive:** [https://doi.org/10.5281/zenodo.XXXXXXX](https://doi.org/10.5281/zenodo.XXXXXXX) <!-- Replace with your Zenodo DOI -->

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/mun9uk-ship-it/VeloSight/issues).

## 📄 License

This project is licensed under the terms described in the [LICENSE](LICENSE) file.

---

# 🇸🇦 العربية

<div dir="rtl">

## 📖 نظرة عامة

**«فيلوسايت»** هي لوحة بيانات تفاعلية حديثة مبنية باستخدام **«آر شايني»**. تتيح للمستخدمين استكشاف بيانات «إم-تي-كارز» الكلاسيكية من خلال فلاتر ديناميكية، ومخطط تشتت تفاعلي مباشر، وبطاقات ملخص للمؤشرات الرئيسية، وجدول بيانات قابل للبحث — كل ذلك في تصميم داكن أنيق مدعوم بمكتبة «بي-إس-ليب».

صُمم هذا المشروع كقالب خفيف وسهل النشر لأي شخص يبدأ في بناء لوحات بيانات تفاعلية بلغة «آر» على منصة **«بوزيت كونكت كلاود»**.

## ✨ المميزات

| الميزة | الوصف |
|---|---|
| 🎚️ **فلاتر ديناميكية** | فلترة السيارات حسب نطاق القوة الحصانية وعدد الأسطوانات |
| 📊 **مخطط تفاعلي** | مخطط تشتت تفاعلي (عبر مكتبة «بلوتلي») لاستهلاك الوقود مقابل الوزن |
| 🚗 **بطاقات المؤشرات** | تحديث فوري لـ «إجمالي السيارات المختارة» و«متوسط القوة الحصانية» |
| 📋 **جدول بيانات** | جدول قابل للفرز والتصفح (عبر مكتبة «دي-تي») للبيانات المفلترة |
| 🌙 **واجهة داكنة حديثة** | مبني بثيم «داركلي» من مكتبة «بي-إس-ليب» |

## 🔴 تجربة مباشرة

جرّب «فيلوسايت» مباشرة من متصفحك — بدون أي تثبيت:

### 👉 **[افتح فيلوسايت](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/)**

## 🖥️ دليل الاستخدام

1. افتح [رابط العرض المباشر](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/) أعلاه.
2. استخدم **أدوات التحكم في الشريط الجانبي** على اليسار من أجل:
   - سحب شريط **نطاق القوة الحصانية** لفلترة السيارات.
   - تحديد أو إلغاء تحديد خانات **الأسطوانات** (٤، ٦، ٨) لإدراج أو استبعاد أنواع السيارات.
3. راقب **بطاقات المؤشرات** أعلى الصفحة وهي تتحدث فوريًا حسب الفلترة.
4. **مرّر الفأرة فوق النقاط** في المخطط لرؤية تفاصيل كل سيارة.
5. استخدم **جدول البيانات** على اليمين لفرز الأعمدة أو التنقل بين الصفحات.

## ⚙️ دليل التشغيل محليًا

### المتطلبات
- لغة «آر» [(رابط التحميل)](https://cran.r-project.org/) — الإصدار ٤.٣ أو أحدث
- برنامج «آر-ستوديو» [(رابط التحميل)](https://posit.co/download/rstudio-desktop/) (موصى به)، أو منصة «بوزيت كلاود» [(رابط)](https://posit.cloud/) التي تعمل من المتصفح مباشرة بدون تثبيت

### الخطوات

```bash
# الخطوة الأولى: استنساخ المستودع
git clone https://github.com/mun9uk-ship-it/VeloSight.git
cd VeloSight
```

```r
# الخطوة الثانية: تثبيت الحزم المطلوبة
install.packages(c("shiny", "bslib", "ggplot2", "plotly", "DT", "bsicons"))

# الخطوة الثالثة: تشغيل التطبيق
shiny::runApp()
```

سيفتح التطبيق تلقائيًا في متصفحك الافتراضي على عنوان الخادم المحلي الذي يظهر في الطرفية.

### 🚀 نشر نسختك الخاصة على «بوزيت كونكت كلاود»

```r
install.packages("rsconnect")
rsconnect::writeManifest()
```

بعد ذلك، ارفع ملف بيانات الاعتماديات الناتج إلى مستودعك على «جيت-هَب»، واربطه عبر: بوزيت كونكت كلاود ← نشر ← من جيت-هَب.

## 🛠️ التقنيات المستخدمة

- **لغة «آر»** [(رابط)](https://www.r-project.org/) — لغة البرمجة الأساسية
- **«شايني»** [(رابط)](https://shiny.posit.co/) — إطار عمل الويب التفاعلي
- **«بي-إس-ليب»** [(رابط)](https://rstudio.github.io/bslib/) — تصميم واجهات حديث
- **«جي-جي-بلوت»** [(رابط)](https://ggplot2.tidyverse.org/) و**«بلوتلي»** [(رابط)](https://plotly.com/r/) — تصورات بيانات تفاعلية
- **«دي-تي»** [(رابط)](https://rstudio.github.io/DT/) — جداول بيانات تفاعلية
- **«بوزيت كونكت كلاود»** [(رابط)](https://connect.posit.cloud/) — الاستضافة والنشر

## 📁 هيكل المستودع

```
VeloSight/
├── app.R              # التطبيق الرئيسي (الواجهة ومنطق الخادم)
├── manifest.json       # ملف الاعتماديات لمنصة النشر
├── renv.lock             # ملف تثبيت إصدارات الحزم
├── LICENSE
├── README.md
└── project.Rproj
```

## 📚 الاستشهاد المرجعي

إذا استخدمت «فيلوسايت» في بحثك أو عملك، يُرجى الاستشهاد به كالتالي:

> _[اسم المؤلف]._ (٢٠٢٦). **فيلوسايت: لوحة بيانات تفاعلية بلغة آر** [برمجية]. زينودو. https://doi.org/10.5281/zenodo.XXXXXXX

- **مُعرّف الباحث (أوركيد):** [https://orcid.org/0000-0000-0000-0000](https://orcid.org/0000-0000-0000-0000) — _استبدله برقمك الخاص_
- **أرشيف زينودو:** [https://doi.org/10.5281/zenodo.XXXXXXX](https://doi.org/10.5281/zenodo.XXXXXXX) — _استبدله برابطك الخاص_

## 🤝 المساهمة

المساهمات، الملاحظات، وطلبات الميزات الجديدة مرحّب بها دائمًا! يمكنك مراجعة صفحة المشكلات على المستودع: [الرابط هنا](https://github.com/mun9uk-ship-it/VeloSight/issues).

## 📄 الترخيص

هذا المشروع مرخّص وفق الشروط الموضحة في ملف الترخيص: [الرابط هنا](LICENSE).

</div>

---

<div align="center">

Made with ❤️ using R Shiny • Deployed on Posit Connect Cloud

</div>
