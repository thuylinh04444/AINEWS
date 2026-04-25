import 'package:flutter/material.dart';
import '../../theme/colors.dart';

// ══════════════════════════════════════════════
//  VOCAB DATA
// ══════════════════════════════════════════════
const _vocab = <String, Map<String, String>>{
  'milestone': {
    'vi': 'Cột mốc quan trọng',
    'phonetic': '/ˈmaɪlstəʊn/',
    'pos': 'noun',
    'example': 'This deal is a major milestone for our company.',
    'exampleVi': 'Thỏa thuận này là cột mốc quan trọng với công ty.',
  },
  'advancement': {
    'vi': 'Sự tiến bộ / phát triển',
    'phonetic': '/ədˈvɑːnsmənt/',
    'pos': 'noun',
    'example': 'The advancement of technology has changed our lives.',
    'exampleVi': 'Sự tiến bộ của công nghệ đã thay đổi cuộc sống của chúng ta.',
  },
  'unprecedented': {
    'vi': 'Chưa từng có tiền lệ',
    'phonetic': '/ʌnˈpresɪdentɪd/',
    'pos': 'adjective',
    'example': 'The growth was unprecedented in the region.',
    'exampleVi': 'Sự tăng trưởng này chưa từng có trong khu vực.',
  },
  'corporations': {
    'vi': 'Các tập đoàn lớn',
    'phonetic': '/ˌkɔːpəˈreɪʃənz/',
    'pos': 'noun',
    'example': 'Major corporations are investing in AI research.',
    'exampleVi': 'Các tập đoàn lớn đang đầu tư vào nghiên cứu AI.',
  },
  'partnerships': {
    'vi': 'Quan hệ đối tác',
    'phonetic': '/ˈpɑːtnəʃɪps/',
    'pos': 'noun',
    'example': 'Strong partnerships drive innovation.',
    'exampleVi': 'Quan hệ đối tác mạnh mẽ thúc đẩy đổi mới sáng tạo.',
  },
  'proliferation': {
    'vi': 'Sự bùng nổ / lan rộng nhanh chóng',
    'phonetic': '/prəˌlɪfəˈreɪʃən/',
    'pos': 'noun',
    'example': 'The proliferation of smartphones changed communication.',
    'exampleVi': 'Sự bùng nổ của điện thoại thông minh đã thay đổi giao tiếp.',
  },
  'paradigms': {
    'vi': 'Các mô hình tư duy / khuôn khổ tiêu chuẩn',
    'phonetic': '/ˈpærədaɪmz/',
    'pos': 'noun',
    'example': 'AI is shifting old business paradigms.',
    'exampleVi': 'AI đang thay đổi các mô hình kinh doanh cũ.',
  },
  'algorithms': {
    'vi': 'Các thuật toán',
    'phonetic': '/ˈælɡərɪðəmz/',
    'pos': 'noun',
    'example': 'Search engines use complex algorithms to rank results.',
    'exampleVi':
        'Các công cụ tìm kiếm dùng thuật toán phức tạp để xếp hạng kết quả.',
  },
  'ecosystem': {
    'vi': 'Hệ sinh thái (công nghệ / kinh doanh)',
    'phonetic': '/ˈiːkəʊsɪstəm/',
    'pos': 'noun',
    'example': 'Vietnam is building a strong tech ecosystem.',
    'exampleVi': 'Việt Nam đang xây dựng một hệ sinh thái công nghệ mạnh mẽ.',
  },
  'conducive': {
    'vi': 'Thuận lợi / có lợi cho',
    'phonetic': '/kənˈdjuːsɪv/',
    'pos': 'adjective',
    'example': 'A quiet environment is conducive to learning.',
    'exampleVi': 'Môi trường yên tĩnh rất thuận lợi cho việc học.',
  },
  'demographic': {
    'vi': 'Nhân khẩu học / liên quan đến dân số',
    'phonetic': '/ˌdeməˈɡræfɪk/',
    'pos': 'adjective / noun',
    'example': 'Vietnam has a favorable demographic profile for tech growth.',
    'exampleVi':
        'Việt Nam có cấu trúc nhân khẩu học thuận lợi cho tăng trưởng công nghệ.',
  },
  'curricula': {
    'vi': 'Chương trình giảng dạy (số nhiều)',
    'phonetic': '/kəˈrɪkjʊlə/',
    'pos': 'noun',
    'example': 'Universities updated their curricula to include AI courses.',
    'exampleVi':
        'Các trường đại học đã cập nhật chương trình giảng dạy để bao gồm các khóa học AI.',
  },
  'conglomerates': {
    'vi': 'Các tập đoàn đa ngành',
    'phonetic': '/kənˈɡlɒmərɪts/',
    'pos': 'noun',
    'example':
        'Multinational conglomerates are entering the Vietnamese market.',
    'exampleVi': 'Các tập đoàn đa quốc gia đang gia nhập thị trường Việt Nam.',
  },
  'geopolitical': {
    'vi': 'Địa chính trị',
    'phonetic': '/ˌdʒiːəʊpəˈlɪtɪkəl/',
    'pos': 'adjective',
    'example': 'Vietnam has a strong geopolitical position in Southeast Asia.',
    'exampleVi': 'Việt Nam có vị trí địa chính trị quan trọng ở Đông Nam Á.',
  },
  'sustained': {
    'vi': 'Được duy trì / bền vững',
    'phonetic': '/səˈsteɪnd/',
    'pos': 'adjective',
    'example': 'Sustained growth requires consistent investment.',
    'exampleVi': 'Tăng trưởng bền vững đòi hỏi đầu tư nhất quán.',
  },
  'convergence': {
    'vi': 'Sự hội tụ / giao thoa',
    'phonetic': '/kənˈvɜːdʒəns/',
    'pos': 'noun',
    'example':
        'The convergence of technologies is driving the fourth industrial revolution.',
    'exampleVi':
        'Sự hội tụ của các công nghệ đang thúc đẩy cuộc cách mạng công nghiệp lần thứ tư.',
  },
  'liberalized': {
    'vi': 'Được tự do hóa / nới lỏng',
    'phonetic': '/ˈlɪbərəlaɪzd/',
    'pos': 'adjective',
    'example': 'A liberalized market attracts more foreign investors.',
    'exampleVi':
        'Thị trường được tự do hóa thu hút nhiều nhà đầu tư nước ngoài hơn.',
  },
  'intelligence': {
    'vi': 'Trí tuệ / thông minh',
    'phonetic': '/ɪnˈtelɪdʒəns/',
    'pos': 'noun',
    'example': 'Artificial intelligence is transforming industries.',
    'exampleVi': 'Trí tuệ nhân tạo đang chuyển đổi các ngành công nghiệp.',
  },
  'infrastructure': {
    'vi': 'Cơ sở hạ tầng',
    'phonetic': '/ˈɪnfrəstrʌktʃər/',
    'pos': 'noun',
    'example': 'The country is investing in digital infrastructure.',
    'exampleVi': 'Đất nước đang đầu tư vào cơ sở hạ tầng số.',
  },
  'investment': {
    'vi': 'Đầu tư',
    'phonetic': '/ɪnˈvestmənt/',
    'pos': 'noun',
    'example': 'Foreign investment has increased significantly.',
    'exampleVi': 'Đầu tư nước ngoài đã tăng đáng kể.',
  },
  'advantage': {
    'vi': 'Lợi thế / ưu điểm',
    'phonetic': '/ədˈvɑːntɪdʒ/',
    'pos': 'noun',
    'example': 'A young workforce is a huge advantage.',
    'exampleVi': 'Lực lượng lao động trẻ là một lợi thế lớn.',
  },
  'productive': {
    'vi': 'Hiệu quả / năng suất cao',
    'phonetic': '/prəˈdʌktɪv/',
    'pos': 'adjective',
    'example': 'A good environment makes workers more productive.',
    'exampleVi': 'Môi trường tốt giúp người lao động hiệu quả hơn.',
  },
  'policies': {
    'vi': 'Các chính sách',
    'phonetic': '/ˈpɒlɪsiz/',
    'pos': 'noun',
    'example': 'New policies were introduced to boost the economy.',
    'exampleVi': 'Các chính sách mới đã được ban hành để thúc đẩy kinh tế.',
  },
  'potential': {
    'vi': 'Tiềm năng',
    'phonetic': '/pəˈtenʃəl/',
    'pos': 'noun / adjective',
    'example': 'This region has huge potential for growth.',
    'exampleVi': 'Khu vực này có tiềm năng tăng trưởng rất lớn.',
  },
  'attract': {
    'vi': 'Thu hút',
    'phonetic': '/əˈtrækt/',
    'pos': 'verb',
    'example': 'Good infrastructure helps attract foreign companies.',
    'exampleVi': 'Cơ sở hạ tầng tốt giúp thu hút các công ty nước ngoài.',
  },
  'economy': {
    'vi': 'Nền kinh tế',
    'phonetic': '/ɪˈkɒnəmi/',
    'pos': 'noun',
    'example': 'The global economy is recovering from the pandemic.',
    'exampleVi': 'Nền kinh tế toàn cầu đang phục hồi sau đại dịch.',
  },
  'skilled': {
    'vi': 'Có kỹ năng / lành nghề',
    'phonetic': '/skɪld/',
    'pos': 'adjective',
    'example': 'There is a high demand for skilled tech workers.',
    'exampleVi': 'Nhu cầu về nhân lực công nghệ có kỹ năng rất cao.',
  },
  'artificial': {
    'vi': 'Nhân tạo',
    'phonetic': '/ˌɑːtɪˈfɪʃəl/',
    'pos': 'adjective',
    'example': 'Artificial flowers look very real.',
    'exampleVi': 'Hoa nhân tạo trông rất thật.',
  },
  'surpassing': {
    'vi': 'Vượt qua / vượt mức',
    'phonetic': '/səˈpɑːsɪŋ/',
    'pos': 'verb',
    'example': 'The sales results were surpassing expectations.',
    'exampleVi': 'Kết quả bán hàng đã vượt qua kỳ vọng.',
  },
  'emerging': {
    'vi': 'Đang nổi lên / mới nổi',
    'phonetic': '/ɪˈmɜːdʒɪŋ/',
    'pos': 'adjective',
    'example': 'Vietnam is one of the emerging economies in Asia.',
    'exampleVi': 'Việt Nam là một trong những nền kinh tế mới nổi ở châu Á.',
  },
  'domestic': {
    'vi': 'Trong nước / nội địa',
    'phonetic': '/dəˈmestɪk/',
    'pos': 'adjective',
    'example': 'The domestic market is growing rapidly.',
    'exampleVi': 'Thị trường trong nước đang tăng trưởng nhanh chóng.',
  },
  'initiatives': {
    'vi': 'Các sáng kiến / chương trình khởi động',
    'phonetic': '/ɪˈnɪʃətɪvz/',
    'pos': 'noun',
    'example': 'The government launched new digital initiatives.',
    'exampleVi': 'Chính phủ đã ra mắt các sáng kiến số mới.',
  },
  'expanding': {
    'vi': 'Mở rộng',
    'phonetic': '/ɪkˈspændɪŋ/',
    'pos': 'verb',
    'example': 'The company is expanding its global presence.',
    'exampleVi': 'Công ty đang mở rộng sự hiện diện toàn cầu.',
  },
  'operations': {
    'vi': 'Hoạt động kinh doanh',
    'phonetic': '/ˌɒpəˈreɪʃənz/',
    'pos': 'noun',
    'example': 'The company expanded its operations to Asia.',
    'exampleVi': 'Công ty mở rộng hoạt động sang châu Á.',
  },
  'establishing': {
    'vi': 'Thiết lập / thành lập',
    'phonetic': '/ɪˈstæblɪʃɪŋ/',
    'pos': 'verb',
    'example': 'They are establishing a new research center.',
    'exampleVi': 'Họ đang thành lập một trung tâm nghiên cứu mới.',
  },
  'capitalize': {
    'vi': 'Tận dụng / khai thác lợi thế',
    'phonetic': '/ˈkæpɪtəlaɪz/',
    'pos': 'verb',
    'example': 'Companies need to capitalize on new opportunities.',
    'exampleVi': 'Các công ty cần tận dụng những cơ hội mới.',
  },
  'trajectory': {
    'vi': 'Xu hướng / quỹ đạo phát triển',
    'phonetic': '/trəˈdʒektəri/',
    'pos': 'noun',
    'example': 'The economy is on a strong growth trajectory.',
    'exampleVi': 'Nền kinh tế đang trên đà tăng trưởng mạnh.',
  },
  'persist': {
    'vi': 'Tiếp tục tồn tại / duy trì',
    'phonetic': '/pəˈsɪst/',
    'pos': 'verb',
    'example': 'The trend is expected to persist for years.',
    'exampleVi': 'Xu hướng này dự kiến sẽ tiếp tục trong nhiều năm.',
  },
  'attributed': {
    'vi': 'Quy cho / cho là do',
    'phonetic': '/əˈtrɪbjuːtɪd/',
    'pos': 'verb',
    'example': 'The success is attributed to hard work.',
    'exampleVi': 'Thành công này được quy cho sự chăm chỉ.',
  },
  'governmental': {
    'vi': 'Thuộc chính phủ / của nhà nước',
    'phonetic': '/ˌɡʌvənˈmentəl/',
    'pos': 'adjective',
    'example': 'Governmental support is key to economic growth.',
    'exampleVi':
        'Sự hỗ trợ của chính phủ là chìa khóa cho tăng trưởng kinh tế.',
  },
  'remarkable': {
    'vi': 'Đáng chú ý / nổi bật',
    'phonetic': '/rɪˈmɑːkəbl/',
    'pos': 'adjective',
    'example': 'The company achieved remarkable growth this year.',
    'exampleVi': 'Công ty đạt được mức tăng trưởng đáng chú ý năm nay.',
  },
  'innovation': {
    'vi': 'Sự đổi mới / sáng tạo',
    'phonetic': '/ˌɪnəˈveɪʃən/',
    'pos': 'noun',
    'example': 'Innovation drives progress in every field.',
    'exampleVi': 'Đổi mới sáng tạo thúc đẩy tiến bộ trong mọi lĩnh vực.',
  },
  'strategic': {
    'vi': 'Chiến lược / mang tính chiến lược',
    'phonetic': '/strəˈtiːdʒɪk/',
    'pos': 'adjective',
    'example': 'They made a strategic decision to enter the Asian market.',
    'exampleVi':
        'Họ đưa ra quyết định chiến lược để thâm nhập thị trường châu Á.',
  },
  'transformation': {
    'vi': 'Sự chuyển đổi / biến đổi',
    'phonetic': '/ˌtrænsˈfɔːmeɪʃən/',
    'pos': 'noun',
    'example': 'Digital transformation is reshaping every industry.',
    'exampleVi': 'Chuyển đổi số đang định hình lại mọi ngành công nghiệp.',
  },
  'development': {
    'vi': 'Sự phát triển',
    'phonetic': '/dɪˈveləpmənt/',
    'pos': 'noun',
    'example': 'Sustainable development is a priority for many nations.',
    'exampleVi': 'Phát triển bền vững là ưu tiên của nhiều quốc gia.',
  },
  'significant': {
    'vi': 'Đáng kể / quan trọng',
    'phonetic': '/sɪɡˈnɪfɪkənt/',
    'pos': 'adjective',
    'example': 'There has been a significant improvement in performance.',
    'exampleVi': 'Đã có sự cải thiện đáng kể về hiệu suất.',
  },
  'achievement': {
    'vi': 'Thành tựu / thành quả',
    'phonetic': '/əˈtʃiːvmənt/',
    'pos': 'noun',
    'example': 'Winning the award was a great achievement.',
    'exampleVi': 'Giành được giải thưởng là một thành tựu lớn.',
  },
  'international': {
    'vi': 'Quốc tế',
    'phonetic': '/ˌɪntəˈnæʃənəl/',
    'pos': 'adjective',
    'example': 'International trade has grown significantly.',
    'exampleVi': 'Thương mại quốc tế đã tăng trưởng đáng kể.',
  },
  'expected': {
    'vi': 'Được kỳ vọng / dự kiến',
    'phonetic': '/ɪkˈspektɪd/',
    'pos': 'adjective',
    'example': 'Results were better than expected.',
    'exampleVi': 'Kết quả tốt hơn so với dự kiến.',
  },
  'favorable': {
    'vi': 'Thuận lợi / có lợi',
    'phonetic': '/ˈfeɪvərəbl/',
    'pos': 'adjective',
    'example': 'The conditions are favorable for investment.',
    'exampleVi': 'Các điều kiện rất thuận lợi cho đầu tư.',
  },
  'education': {
    'vi': 'Giáo dục',
    'phonetic': '/ˌedʒuˈkeɪʃən/',
    'pos': 'noun',
    'example': 'Education is the foundation of a strong society.',
    'exampleVi': 'Giáo dục là nền tảng của một xã hội vững mạnh.',
  },
  'dynamic': {
    'vi': 'Năng động / sôi động',
    'phonetic': '/daɪˈnæmɪk/',
    'pos': 'adjective',
    'example': 'She is a dynamic and inspiring leader.',
    'exampleVi': 'Cô ấy là một nhà lãnh đạo năng động và truyền cảm hứng.',
  },
  'urban': {
    'vi': 'Thuộc đô thị / thành thị',
    'phonetic': '/ˈɜːbən/',
    'pos': 'adjective',
    'example': 'Urban areas are growing faster than rural ones.',
    'exampleVi': 'Các khu vực đô thị đang phát triển nhanh hơn vùng nông thôn.',
  },
  'centers': {
    'vi': 'Các trung tâm',
    'phonetic': '/ˈsentəz/',
    'pos': 'noun',
    'example': 'Innovation centers are being built across the country.',
    'exampleVi': 'Các trung tâm đổi mới đang được xây dựng trên khắp cả nước.',
  },
  'interest': {
    'vi': 'Sự quan tâm / lãi suất',
    'phonetic': '/ˈɪntrəst/',
    'pos': 'noun',
    'example': 'There is growing interest in renewable energy.',
    'exampleVi': 'Ngày càng có nhiều sự quan tâm đến năng lượng tái tạo.',
  },
  'increasing': {
    'vi': 'Ngày càng tăng / gia tăng',
    'phonetic': '/ɪnˈkriːsɪŋ/',
    'pos': 'adjective',
    'example': 'There is increasing demand for skilled workers.',
    'exampleVi': 'Nhu cầu về lao động có kỹ năng ngày càng tăng.',
  },
  'global': {
    'vi': 'Toàn cầu',
    'phonetic': '/ˈɡləʊbl/',
    'pos': 'adjective',
    'example': 'We need a global solution to climate change.',
    'exampleVi': 'Chúng ta cần giải pháp toàn cầu cho vấn đề biến đổi khí hậu.',
  },
  'growth': {
    'vi': 'Sự tăng trưởng',
    'phonetic': '/ɡrəʊθ/',
    'pos': 'noun',
    'example': 'Economic growth has slowed down this year.',
    'exampleVi': 'Tăng trưởng kinh tế đã chậm lại trong năm nay.',
  },
  'digital': {
    'vi': 'Kỹ thuật số / số hóa',
    'phonetic': '/ˈdɪdʒɪtl/',
    'pos': 'adjective',
    'example': 'Digital transformation is key to staying competitive.',
    'exampleVi': 'Chuyển đổi số là chìa khóa để duy trì tính cạnh tranh.',
  },
  'technology': {
    'vi': 'Công nghệ',
    'phonetic': '/tekˈnɒlədʒi/',
    'pos': 'noun',
    'example': 'Technology has transformed how we communicate.',
    'exampleVi': 'Công nghệ đã thay đổi cách chúng ta giao tiếp.',
  },
  'research': {
    'vi': 'Nghiên cứu',
    'phonetic': '/rɪˈsɜːtʃ/',
    'pos': 'noun',
    'example': 'Research is essential to innovation.',
    'exampleVi': 'Nghiên cứu là điều thiết yếu cho sự đổi mới.',
  },
  'market': {
    'vi': 'Thị trường',
    'phonetic': '/ˈmɑːkɪt/',
    'pos': 'noun',
    'example': 'The stock market can be unpredictable.',
    'exampleVi': 'Thị trường chứng khoán có thể khó đoán.',
  },
  'industry': {
    'vi': 'Ngành công nghiệp',
    'phonetic': '/ˈɪndəstri/',
    'pos': 'noun',
    'example': 'The tech industry is booming worldwide.',
    'exampleVi': 'Ngành công nghệ đang bùng nổ trên toàn cầu.',
  },
  'regulatory': {
    'vi': 'Liên quan đến quy định / pháp lý',
    'phonetic': '/ˈreɡjʊlətəri/',
    'pos': 'adjective',
    'example': 'The government set up a new regulatory framework for AI.',
    'exampleVi': 'Chính phủ đã thiết lập khung pháp lý mới cho AI.',
  },
  'intellectual': {
    'vi': 'Trí tuệ / tinh thần',
    'phonetic': '/ˌɪntəˈlektʃuəl/',
    'pos': 'adjective',
    'example': 'Intellectual property rights protect inventions.',
    'exampleVi': 'Quyền sở hữu trí tuệ bảo vệ các phát minh.',
  },
  'workforce': {
    'vi': 'Lực lượng lao động',
    'phonetic': '/ˈwɜːkfɔːs/',
    'pos': 'noun',
    'example': 'The country needs a trained tech workforce.',
    'exampleVi':
        'Đất nước cần một lực lượng lao động công nghệ được đào tạo tốt.',
  },
  'valuation': {
    'vi': 'Mức định giá / giá trị được đánh giá',
    'phonetic': '/ˌvæljuˈeɪʃən/',
    'pos': 'noun',
    'example': 'The startup reached a valuation of one billion dollars.',
    'exampleVi': 'Startup đó đạt mức định giá một tỷ đô la.',
  },
  'compound': {
    'vi': 'Kép / tổng hợp (tăng trưởng kép)',
    'phonetic': '/ˈkɒmpaʊnd/',
    'pos': 'adjective',
    'example': 'Compound growth means growth that builds on itself each year.',
    'exampleVi':
        'Tăng trưởng kép có nghĩa là tăng trưởng tích lũy qua từng năm.',
  },
  'streamline': {
    'vi': 'Hợp lý hóa / làm cho hiệu quả hơn',
    'phonetic': '/ˈstriːmlaɪn/',
    'pos': 'verb',
    'example': 'AI can streamline many business processes.',
    'exampleVi': 'AI có thể hợp lý hóa nhiều quy trình kinh doanh.',
  },
};

const _originalVocabKeys = [
  'milestone',
  'advancement',
  'unprecedented',
  'corporations',
  'partnerships',
  'proliferation',
  'paradigms',
  'algorithms',
  'ecosystem',
  'conducive',
  'demographic',
  'curricula',
  'conglomerates',
  'geopolitical',
  'sustained',
  'convergence',
  'liberalized',
];

const _basicVocabKeys = [
  'investment',
  'advantage',
  'productive',
  'policies',
  'potential',
  'attract',
  'economy',
  'skilled',
];

// ══════════════════════════════════════════════
//  CONTENT
// ══════════════════════════════════════════════
const _originalSentences = <List<String>>[
  [
    "Vietnam's artificial intelligence industry has reached a significant milestone, surpassing \$1.2 billion in total market value, cementing the country's position as a formidable contender in Southeast Asia's burgeoning technology landscape.",
    "Ngành công nghiệp trí tuệ nhân tạo của Việt Nam đã đạt được một cột mốc quan trọng, vượt mốc 1,2 tỷ USD tổng giá trị thị trường, khẳng định vị thế của đất nước như một đối thủ mạnh mẽ trong bức tranh công nghệ đang phát triển của Đông Nam Á.",
  ],
  [
    "This achievement reflects the country's rapid advancement in the field of emerging technologies and highlights its growing role in the global digital economy.",
    "Thành tựu này phản ánh sự tiến bộ nhanh chóng của đất nước trong lĩnh vực công nghệ mới nổi và nhấn mạnh vai trò ngày càng lớn của Việt Nam trong nền kinh tế số toàn cầu.",
  ],
  [
    "In recent years, Vietnam has experienced remarkable and unprecedented growth in AI investment, driven by both domestic initiatives and increasing interest from international technology corporations.",
    "Trong những năm gần đây, Việt Nam đã trải qua sự tăng trưởng đáng chú ý và chưa từng có trong đầu tư AI, được thúc đẩy bởi cả các sáng kiến trong nước lẫn sự quan tâm ngày càng tăng từ các tập đoàn công nghệ quốc tế.",
  ],
  [
    "Major tech companies have been steadily expanding their operations in key urban centers such as Hanoi and Ho Chi Minh City, establishing research hubs, innovation labs, and strategic partnerships to capitalize on the country's dynamic market potential.",
    "Các công ty công nghệ lớn đã và đang liên tục mở rộng hoạt động tại các trung tâm đô thị trọng điểm như Hà Nội và TP. Hồ Chí Minh, thiết lập các trung tâm nghiên cứu, phòng thí nghiệm đổi mới và quan hệ đối tác chiến lược nhằm tận dụng tiềm năng thị trường năng động của đất nước.",
  ],
  [
    "The proliferation of AI-driven applications across diverse sectors — including healthcare, finance, manufacturing, and logistics — has fundamentally transformed operational paradigms and elevated productivity benchmarks across industries.",
    "Sự bùng nổ của các ứng dụng được thúc đẩy bởi AI trên nhiều lĩnh vực khác nhau — bao gồm y tế, tài chính, sản xuất và logistics — đã biến đổi căn bản các mô hình vận hành và nâng cao tiêu chuẩn năng suất trên toàn ngành.",
  ],
  [
    "Both startups and established enterprises are leveraging sophisticated machine learning algorithms, natural language processing, and computer vision technologies to streamline workflows and enhance customer experience.",
    "Cả các công ty khởi nghiệp lẫn doanh nghiệp lâu đời đều đang khai thác các thuật toán học máy tinh vi, xử lý ngôn ngữ tự nhiên và công nghệ thị giác máy tính để hợp lý hóa quy trình làm việc và nâng cao trải nghiệm khách hàng.",
  ],
  [
    "Governmental agencies have demonstrated a robust commitment to fostering an ecosystem conducive to technological innovation, allocating substantial budgetary resources toward digital infrastructure modernization.",
    "Các cơ quan chính phủ đã thể hiện cam kết mạnh mẽ trong việc thúc đẩy hệ sinh thái thuận lợi cho đổi mới công nghệ, phân bổ nguồn ngân sách đáng kể cho việc hiện đại hóa cơ sở hạ tầng kỹ thuật số.",
  ],
  [
    "The Ministry of Information and Communications has spearheaded numerous regulatory frameworks designed to facilitate cross-border data flows, safeguard intellectual property rights, and engender confidence among prospective foreign investors.",
    "Bộ Thông tin và Truyền thông đã dẫn đầu nhiều khung pháp lý được thiết kế để tạo điều kiện cho luồng dữ liệu xuyên biên giới, bảo vệ quyền sở hữu trí tuệ và xây dựng lòng tin cho các nhà đầu tư nước ngoài tiềm năng.",
  ],
  [
    "Vietnam's notable demographic dividend — characterized by a large, young population with strong digital literacy rates — provides a compelling competitive advantage in cultivating a highly proficient AI-ready workforce.",
    "Lợi thế nhân khẩu học đáng chú ý của Việt Nam — được đặc trưng bởi dân số trẻ, đông đảo với tỷ lệ biết chữ kỹ thuật số cao — mang lại lợi thế cạnh tranh thuyết phục trong việc nuôi dưỡng một lực lượng lao động sẵn sàng cho AI.",
  ],
  [
    "Leading universities and vocational institutions have proactively collaborated with industry stakeholders to implement specialized curricula in data science, machine learning, and software engineering disciplines.",
    "Các trường đại học hàng đầu và cơ sở đào tạo nghề đã chủ động phối hợp với các bên liên quan trong ngành để triển khai chương trình giảng dạy chuyên biệt về khoa học dữ liệu, học máy và kỹ thuật phần mềm.",
  ],
  [
    "According to industry experts, this upward trajectory is expected to persist well through 2025 and beyond, with compound annual growth rates projected to remain in double digits.",
    "Theo các chuyên gia trong ngành, xu hướng đi lên này dự kiến sẽ tiếp tục vượt qua năm 2025 và xa hơn nữa, với tốc độ tăng trưởng hàng năm kép được dự báo sẽ duy trì ở mức hai chữ số.",
  ],
  [
    "The sustained growth is largely attributed to strong governmental support, encompassing favorable investment policies, comprehensive digital transformation strategies, and significant public expenditure in education and infrastructure.",
    "Sự tăng trưởng bền vững này phần lớn được quy cho sự hỗ trợ mạnh mẽ của chính phủ, bao gồm các chính sách đầu tư thuận lợi, chiến lược chuyển đổi số toàn diện và chi tiêu công đáng kể vào giáo dục cùng cơ sở hạ tầng.",
  ],
  [
    "Financial analysts project that Vietnam's AI ecosystem could potentially reach a valuation of \$3 billion by 2028, contingent upon sustained policy continuity and accelerated talent acquisition.",
    "Các nhà phân tích tài chính dự báo rằng hệ sinh thái AI của Việt Nam có thể đạt mức định giá 3 tỷ USD vào năm 2028, phụ thuộc vào sự ổn định chính sách liên tục và tốc độ tuyển dụng nhân tài được đẩy nhanh.",
  ],
  [
    "International conglomerates have increasingly recognized Vietnam's strategic geopolitical positioning, competitive operational costs, and rapidly expanding consumer base as compelling rationale for establishing regional headquarters and innovation centers.",
    "Các tập đoàn quốc tế ngày càng nhận ra vị trí địa chính trị chiến lược của Việt Nam, chi phí vận hành cạnh tranh và cơ sở người tiêu dùng mở rộng nhanh chóng như một lý do thuyết phục để thiết lập trụ sở khu vực và trung tâm đổi mới.",
  ],
  [
    "The convergence of robust telecommunications infrastructure, a progressively liberalized investment climate, and a rapidly maturing domestic technology sector has rendered Vietnam an exceptionally attractive destination for global capital deployment in AI.",
    "Sự hội tụ của cơ sở hạ tầng viễn thông vững chắc, môi trường đầu tư ngày càng được tự do hóa và lĩnh vực công nghệ trong nước đang trưởng thành nhanh chóng đã khiến Việt Nam trở thành điểm đến hấp dẫn đặc biệt cho việc triển khai vốn toàn cầu vào AI.",
  ],
  [
    "Collectively, these multifaceted developments are forging a profoundly conducive environment for the accelerated and sustained development of artificial intelligence throughout Vietnam, setting the stage for transformative economic impact in the decade ahead.",
    "Tổng thể, những phát triển đa chiều này đang tạo ra một môi trường vô cùng thuận lợi cho sự phát triển nhanh chóng và bền vững của trí tuệ nhân tạo trên toàn Việt Nam, tạo tiền đề cho tác động kinh tế mang tính chuyển đổi trong thập kỷ tới.",
  ],
];

const _basicSentences = <List<String>>[
  [
    "Vietnam's AI industry has hit a big goal, passing \$1.2 billion in total value, making it one of the strongest tech countries in Southeast Asia.",
    "Ngành AI của Việt Nam đã đạt được một mục tiêu lớn, vượt mốc 1,2 tỷ USD, trở thành một trong những quốc gia công nghệ mạnh nhất Đông Nam Á.",
  ],
  [
    "This shows how fast Vietnam is growing in new technology and how important it is becoming in the world's digital economy.",
    "Điều này cho thấy Việt Nam đang phát triển nhanh như thế nào trong công nghệ mới và tầm quan trọng ngày càng lớn của nước ta trong nền kinh tế số toàn cầu.",
  ],
  [
    "In recent years, Vietnam has seen amazing and never-before-seen growth in AI investment, pushed by local programs and more and more interest from large international tech companies.",
    "Trong những năm gần đây, Việt Nam đã chứng kiến sự tăng trưởng đầu tư AI ấn tượng và chưa từng có, được thúc đẩy bởi các chương trình trong nước và sự quan tâm ngày càng tăng từ các công ty công nghệ quốc tế lớn.",
  ],
  [
    "Big tech companies have been steadily growing their work in key cities like Hanoi and Ho Chi Minh City, setting up research centers, idea labs, and partnerships to make the most of the country's strong market potential.",
    "Các công ty công nghệ lớn đã liên tục mở rộng hoạt động tại các thành phố lớn như Hà Nội và TP. Hồ Chí Minh, thiết lập các trung tâm nghiên cứu, phòng thí nghiệm ý tưởng và quan hệ đối tác để khai thác hết tiềm năng thị trường mạnh mẽ của đất nước.",
  ],
  [
    "AI tools are now being used in many fields — including health care, banking, making goods, and shipping — and this has greatly changed how businesses work and how productive they are.",
    "Các công cụ AI hiện đang được sử dụng trong nhiều lĩnh vực — bao gồm y tế, ngân hàng, sản xuất hàng hóa và vận chuyển — và điều này đã thay đổi lớn cách các doanh nghiệp vận hành và mức độ hiệu quả của họ.",
  ],
  [
    "Both new small companies and large old businesses are now using smart AI tools like machine learning and image recognition to make their work faster and to give customers a better experience.",
    "Cả các công ty nhỏ mới thành lập lẫn các doanh nghiệp lớn lâu đời đều đang sử dụng các công cụ AI thông minh như học máy và nhận dạng hình ảnh để tăng tốc công việc và mang lại trải nghiệm tốt hơn cho khách hàng.",
  ],
  [
    "The government has shown strong support for helping new technology grow, spending a lot of money to build better digital systems and train more skilled workers.",
    "Chính phủ đã thể hiện sự ủng hộ mạnh mẽ trong việc thúc đẩy công nghệ mới phát triển, đầu tư nhiều tiền để xây dựng hệ thống số tốt hơn và đào tạo thêm nhiều nhân lực có kỹ năng.",
  ],
  [
    "The Ministry of Information and Communications has created new rules to make it easier for foreign companies to work here, protect new ideas, and help outside investors feel safe coming to Vietnam.",
    "Bộ Thông tin và Truyền thông đã ban hành các quy định mới nhằm tạo điều kiện cho các công ty nước ngoài hoạt động tại đây, bảo vệ ý tưởng mới và giúp các nhà đầu tư bên ngoài cảm thấy an toàn khi đến Việt Nam.",
  ],
  [
    "Vietnam has a young, large population that is good with digital tools, which gives the country a big advantage in training many skilled AI workers for the future.",
    "Việt Nam có dân số trẻ, đông đảo và thành thạo các công cụ kỹ thuật số, điều này mang lại cho đất nước một lợi thế lớn trong việc đào tạo nhiều nhân lực AI có kỹ năng cho tương lai.",
  ],
  [
    "Top universities and training schools around the country have worked together with tech companies to create special courses in data science, machine learning, and computer programming.",
    "Các trường đại học hàng đầu và cơ sở đào tạo trong cả nước đã hợp tác với các công ty công nghệ để tạo ra các khóa học chuyên biệt về khoa học dữ liệu, học máy và lập trình máy tính.",
  ],
  [
    "Experts think this upward trend will keep going well into 2025 and beyond, with strong growth rates staying high for many years.",
    "Các chuyên gia cho rằng xu hướng tăng trưởng này sẽ tiếp tục vượt qua năm 2025 và nhiều năm sau, với tốc độ tăng trưởng mạnh duy trì ở mức cao trong thời gian dài.",
  ],
  [
    "This steady growth is mainly because of strong government help, including good investment policies, digital change plans, and spending a lot on schools and buildings.",
    "Sự tăng trưởng ổn định này chủ yếu là nhờ sự hỗ trợ mạnh mẽ của chính phủ, bao gồm các chính sách đầu tư tốt, kế hoạch chuyển đổi số và chi tiêu lớn cho trường học và công trình hạ tầng.",
  ],
  [
    "Finance experts think Vietnam's AI market could reach a value of \$3 billion by 2028, if the government keeps its good policies and more skilled workers join the industry.",
    "Các chuyên gia tài chính dự báo thị trường AI của Việt Nam có thể đạt giá trị 3 tỷ USD vào năm 2028, nếu chính phủ duy trì các chính sách tốt và có thêm nhiều nhân lực có kỹ năng gia nhập ngành.",
  ],
  [
    "Large global companies have noticed that Vietnam has a great location, lower costs, and a fast-growing number of customers, making it a good place to open regional offices and innovation centers.",
    "Các công ty toàn cầu lớn đã nhận thấy Việt Nam có vị trí địa lý tốt, chi phí thấp hơn và số lượng khách hàng tăng nhanh, biến nơi đây thành địa điểm lý tưởng để mở văn phòng khu vực và trung tâm đổi mới.",
  ],
  [
    "Strong phone and internet networks, open rules for outside investors, and a fast-growing local tech sector all attract global companies and help Vietnam's economy become stronger every year.",
    "Mạng lưới điện thoại và internet mạnh mẽ, các quy định mở cho nhà đầu tư bên ngoài và ngành công nghệ trong nước phát triển nhanh đều thu hút các công ty toàn cầu và giúp nền kinh tế Việt Nam ngày càng vững mạnh hơn.",
  ],
  [
    "Together, all of these changes are creating a very good environment for AI to grow fast and for a long time in Vietnam, which will have a big and positive impact on the country's economy in the years ahead.",
    "Cùng nhau, tất cả những thay đổi này đang tạo ra một môi trường rất tốt để AI phát triển nhanh và lâu dài tại Việt Nam, điều này sẽ có tác động lớn và tích cực đến nền kinh tế đất nước trong những năm tới.",
  ],
];

//  SCREEN

class ArticleDetailScreen extends StatefulWidget {
  final Map<String, String> data;
  const ArticleDetailScreen({super.key, required this.data});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  bool _isOriginal = true;
  bool _showVietnamese = false;
  bool _isPlaying = false;
  bool _showSpeedMenu = false;
  double _ttsSpeed = 1.0;

  final _commentController = TextEditingController();
  final List<Map<String, String>> _comments = [
    {
      'name': 'Thuỳ Linh',
      'avatar': 'https://i.pravatar.cc/150?img=1',
      'text':
          'Amazing progress! Vietnam is becoming a tech powerhouse in Southeast Asia.',
      'time': '2 giờ trước',
    },
    {
      'name': 'Ngọc Nhi',
      'avatar': 'https://i.pravatar.cc/150?img=5',
      'text':
          'This is great news for our economy. More investment means more opportunities for tech professionals.',
      'time': '4 giờ trước',
    },
    {
      'name': 'Minh Khoa',
      'avatar': 'https://i.pravatar.cc/150?img=12',
      'text': 'Rất tự hào về sự phát triển của AI Việt Nam!',
      'time': '6 giờ trước',
    },
  ];

  OverlayEntry? _speedOverlay;
  final LayerLink _speedLayerLink = LayerLink();
  static const _speeds = [0.5, 1.0, 1.5];

  List<String> get _currentVocabKeys =>
      _isOriginal ? _originalVocabKeys : _basicVocabKeys;

  List<List<String>> get _sentences =>
      _isOriginal ? _originalSentences : _basicSentences;

  @override
  void dispose() {
    _removeSpeedOverlay();
    _commentController.dispose();
    super.dispose();
  }

  void _removeSpeedOverlay() {
    _speedOverlay?.remove();
    _speedOverlay = null;
    if (mounted) setState(() => _showSpeedMenu = false);
  }

  void _toggleSpeedMenu() {
    if (_showSpeedMenu) {
      _removeSpeedOverlay();
      return;
    }
    setState(() => _showSpeedMenu = true);
    _speedOverlay = OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _removeSpeedOverlay,
                ),
              ),
              CompositedTransformFollower(
                link: _speedLayerLink,
                showWhenUnlinked: false,
                offset: const Offset(-20, 40),
                child: Material(
                  elevation: 12,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: C.border),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          _speeds.map((s) {
                            final selected = s == _ttsSpeed;
                            final label = s == 1.0 ? '1x' : '${s}x';
                            return GestureDetector(
                              onTap: () {
                                setState(() => _ttsSpeed = s);
                                _removeSpeedOverlay();
                              },
                              child: Container(
                                width: 80,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                color:
                                    selected
                                        ? C.purpleLight
                                        : Colors.transparent,
                                child: Row(
                                  children: [
                                    if (selected)
                                      const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: C.purple,
                                      )
                                    else
                                      const SizedBox(width: 14),
                                    const SizedBox(width: 6),
                                    Text(
                                      label,
                                      style: TextStyle(
                                        color: selected ? C.purple : C.textDark,
                                        fontSize: 13,
                                        fontWeight:
                                            selected
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
    Overlay.of(context).insert(_speedOverlay!);
  }

  String get _speedLabel => _ttsSpeed == 1.0 ? '1x' : '${_ttsSpeed}x';

  void _showWordPopup(String word) {
    final clean = word.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
    if (clean.isEmpty) return;
    final info = _vocab[clean];
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (_) => _VocabDialog(wordKey: clean, info: info),
    );
  }

  Widget _buildSentenceInline(String sentence) {
    final words = sentence.split(' ');
    return Wrap(
      children:
          words.map((word) {
            final clean = word.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
            final isHighlighted = _currentVocabKeys.contains(clean);
            final hasData = _vocab.containsKey(clean);
            return GestureDetector(
              onTap: clean.isNotEmpty ? () => _showWordPopup(word) : null,
              child: Text(
                '$word ',
                style: TextStyle(
                  color: isHighlighted ? C.gold : C.textDark,
                  fontSize: 15,
                  height: 1.75,
                  decoration:
                      isHighlighted
                          ? TextDecoration.underline
                          : (hasData
                              ? TextDecoration.underline
                              : TextDecoration.none),
                  decorationColor:
                      isHighlighted
                          ? C.gold
                          : C.textGrey.withValues(alpha: 0.4),
                  decorationThickness: isHighlighted ? 2.5 : 1.2,
                  decorationStyle:
                      hasData && !isHighlighted
                          ? TextDecorationStyle.dotted
                          : TextDecorationStyle.solid,
                  fontWeight:
                      isHighlighted ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
    );
  }

  void _submitComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _comments.insert(0, {
        'name': 'Bạn',
        'avatar': '',
        'text': text,
        'time': 'Vừa xong',
      });
    });
    _commentController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    final d = widget.data;

    return Scaffold(
      backgroundColor: C.surface,
      body: GestureDetector(
        onTap: () {
          if (_showSpeedMenu) _removeSpeedOverlay();
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: Image.network(
                        d['image'] ??
                            'https://picsum.photos/seed/detail/400/260',
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) =>
                                Container(color: const Color(0xFF23234A)),
                      ),
                    ),
                    Container(
                      height: 240,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x99000000), Colors.transparent],
                          stops: [0.0, 0.55],
                        ),
                      ),
                    ),
                    Positioned(
                      top: top + 8,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.35),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 14,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          d['category'] ?? 'Technology',
                          style: const TextStyle(
                            color: C.textDark,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      d['title'] ?? 'Vietnam AI Industry Hits \$1.2B Milestone',
                      style: const TextStyle(
                        color: C.textDark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      d['desc'] ?? 'Ngành AI Việt Nam đạt mốc 1,2 tỷ USD',
                      style: const TextStyle(
                        color: C.textGrey,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://i.pravatar.cc/150?img=20',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (_, __, ___) => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: C.purpleLight,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'V',
                                      style: TextStyle(
                                        color: C.purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    d['source']?.replaceAll('Nguồn: ', '') ??
                                        'VnExpress',
                                    style: const TextStyle(
                                      color: C.textDark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: C.purpleLight,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'Follow',
                                      style: TextStyle(
                                        color: C.purple,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '• ${d['time'] ?? '2 hours ago'}',
                                style: const TextStyle(
                                  color: C.textGrey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _ModeToggle(
                          isOriginal: _isOriginal,
                          onChanged: (v) => setState(() => _isOriginal = v),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: C.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: C.border),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap:
                                    () => setState(
                                      () => _isPlaying = !_isPlaying,
                                    ),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                    color: C.purple,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    _isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Text - to - Speech',
                                    style: TextStyle(
                                      color: C.textDark,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Nghe bài viết',
                                    style: TextStyle(
                                      color: C.textGrey,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CompositedTransformTarget(
                                link: _speedLayerLink,
                                child: GestureDetector(
                                  onTap: _toggleSpeedMenu,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          _showSpeedMenu
                                              ? C.purpleLight
                                              : Colors.transparent,
                                      border: Border.all(
                                        color:
                                            _showSpeedMenu
                                                ? C.purple
                                                : C.border,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          _speedLabel,
                                          style: TextStyle(
                                            color:
                                                _showSpeedMenu
                                                    ? C.purple
                                                    : C.textDark,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 2),
                                        Icon(
                                          _showSpeedMenu
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          size: 14,
                                          color:
                                              _showSpeedMenu
                                                  ? C.purple
                                                  : C.textGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: _isPlaying ? 0.45 : 0.0,
                              backgroundColor: C.border,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                C.purple,
                              ),
                              minHeight: 4,
                            ),
                          ),
                          if (_isPlaying) ...[
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tốc độ: $_speedLabel',
                                  style: const TextStyle(
                                    color: C.textGrey,
                                    fontSize: 11,
                                  ),
                                ),
                                const Text(
                                  '0:23 / 0:52',
                                  style: TextStyle(
                                    color: C.textGrey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: C.gold.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: C.gold.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text('💡 ', style: TextStyle(fontSize: 13)),
                          Expanded(
                            child: Text(
                              _isOriginal
                                  ? 'Từ vàng là thuật ngữ chuyên ngành — nhấn bất kỳ từ nào để tra nghĩa'
                                  : 'Từ vàng là từ ít gặp nhất ở cấp cơ bản — nhấn bất kỳ từ nào để tra nghĩa',
                              style: const TextStyle(
                                color: C.gold,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    GestureDetector(
                      onTap:
                          () => setState(
                            () => _showVietnamese = !_showVietnamese,
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Display Vietnamese translation',
                            style: TextStyle(
                              color: C.purple.withValues(alpha: 0.85),
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(width: 10),
                          _OnOffToggle(on: _showVietnamese),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    if (!_showVietnamese)
                      Wrap(
                        children:
                            _sentences.expand((pair) {
                              final words = pair[0].split(' ');
                              return words.map((word) {
                                final clean = word.toLowerCase().replaceAll(
                                  RegExp(r'[^a-z]'),
                                  '',
                                );
                                final isHighlighted = _currentVocabKeys
                                    .contains(clean);
                                final hasData = _vocab.containsKey(clean);
                                return GestureDetector(
                                  onTap:
                                      clean.isNotEmpty
                                          ? () => _showWordPopup(word)
                                          : null,
                                  child: Text(
                                    '$word ',
                                    style: TextStyle(
                                      color:
                                          isHighlighted ? C.gold : C.textDark,
                                      fontSize: 15,
                                      height: 1.75,
                                      decoration:
                                          isHighlighted
                                              ? TextDecoration.underline
                                              : (hasData
                                                  ? TextDecoration.underline
                                                  : TextDecoration.none),
                                      decorationColor:
                                          isHighlighted
                                              ? C.gold
                                              : C.textGrey.withValues(
                                                alpha: 0.4,
                                              ),
                                      decorationThickness:
                                          isHighlighted ? 2.5 : 1.2,
                                      decorationStyle:
                                          hasData && !isHighlighted
                                              ? TextDecorationStyle.dotted
                                              : TextDecorationStyle.solid,
                                      fontWeight:
                                          isHighlighted
                                              ? FontWeight.w600
                                              : FontWeight.normal,
                                    ),
                                  ),
                                );
                              });
                            }).toList(),
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            _sentences.map((pair) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildSentenceInline(pair[0]),
                                    const SizedBox(height: 4),
                                    Text(
                                      pair[1],
                                      style: const TextStyle(
                                        color: C.textGrey,
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),

                    const SizedBox(height: 28),
                    Container(height: 1, color: C.border),
                    const SizedBox(height: 20),

                    Text(
                      'Comments (${_comments.length})',
                      style: const TextStyle(
                        color: C.textDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: C.purpleLight,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: C.purple,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: C.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: C.border),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            child: TextField(
                              controller: _commentController,
                              style: const TextStyle(
                                color: C.textDark,
                                fontSize: 13,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Nhập bình luận',
                                hintStyle: TextStyle(
                                  color: C.textGrey,
                                  fontSize: 13,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              onSubmitted: (_) => _submitComment(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    ..._comments.map(
                      (c) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            c['avatar']!.isNotEmpty
                                ? ClipOval(
                                  child: Image.network(
                                    c['avatar']!,
                                    width: 38,
                                    height: 38,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (_, __, ___) => _defaultAvatar(),
                                  ),
                                )
                                : _defaultAvatar(),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    c['name']!,
                                    style: const TextStyle(
                                      color: C.textDark,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    c['text']!,
                                    style: const TextStyle(
                                      color: C.textGrey,
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _defaultAvatar() => Container(
    width: 38,
    height: 38,
    decoration: const BoxDecoration(
      color: C.purpleLight,
      shape: BoxShape.circle,
    ),
    child: const Icon(Icons.person, color: C.purple, size: 20),
  );
}

//  MODE TOGGLE
class _ModeToggle extends StatelessWidget {
  final bool isOriginal;
  final ValueChanged<bool> onChanged;
  const _ModeToggle({required this.isOriginal, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF625993)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ModeBtn(
            label: 'Basic',
            active: !isOriginal,
            onTap: () => onChanged(false),
          ),
          _ModeBtn(
            label: 'Original',
            active: isOriginal,
            onTap: () => onChanged(true),
          ),
        ],
      ),
    );
  }
}

//  ON/OFF TOGGLE
class _OnOffToggle extends StatelessWidget {
  final bool on;
  const _OnOffToggle({required this.on});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF625993)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ToggleBtn(label: 'Off', active: !on),
          _ToggleBtn(label: 'On', active: on),
        ],
      ),
    );
  }
}

class _ModeBtn extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _ModeBtn({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF625993) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : const Color(0xFF625993),
            fontSize: 12,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _ToggleBtn extends StatelessWidget {
  final String label;
  final bool active;
  const _ToggleBtn({required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF625993) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : const Color(0xFF625993),
          fontSize: 12,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

//  VOCAB DIALOG
class _VocabDialog extends StatelessWidget {
  final String wordKey;
  final Map<String, String>? info;
  const _VocabDialog({required this.wordKey, required this.info});

  static const _darkBg = Color(0xFF1A1A2E);

  @override
  Widget build(BuildContext context) {
    final hasData = info != null;
    final hasPhonetic = hasData && (info!['phonetic']?.isNotEmpty ?? false);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Container(
        decoration: BoxDecoration(
          color: _darkBg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 16, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wordKey,
                          style: const TextStyle(
                            color: C.yellow,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (hasPhonetic) ...[
                          const SizedBox(height: 4),
                          Text(
                            info!['phonetic']!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                        if (hasData) ...[
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              info!['pos']!,
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      if (hasData)
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.record_voice_over_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(top: 4),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white54,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            if (hasData) ...[
              _infoBox(
                label: 'Nghĩa Tiếng Việt',
                content: info!['vi']!,
                isTitle: true,
              ),
              const SizedBox(height: 10),
              _infoBox(
                label: 'Ví dụ trong câu',
                content: info!['example']!,
                subContent: info!['exampleVi'],
                isHighlight: true,
              ),
            ] else ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Từ điển',
                        style: TextStyle(color: Colors.white60, fontSize: 11),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: C.yellow.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.search,
                              color: C.yellow,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'Từ này chưa có trong kho từ điển.\nTính năng tra từ điển đầy đủ sắp ra mắt!',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: C.yellow,
                    foregroundColor: _darkBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    hasData ? 'Lưu vào kho' : 'Xem trong từ điển',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox({
    required String label,
    required String content,
    String? subContent,
    bool isTitle = false,
    bool isHighlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white60, fontSize: 11),
            ),
            const SizedBox(height: 6),
            Text(
              content,
              style: TextStyle(
                color: isHighlight ? C.yellow : Colors.white,
                fontSize: isTitle ? 15 : 13,
                fontWeight: isTitle ? FontWeight.bold : FontWeight.w600,
                height: 1.5,
              ),
            ),
            if (subContent != null) ...[
              const SizedBox(height: 4),
              Text(
                subContent,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
